!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
!
! Chemistry module
!
! - Emissions
!
! - Chemistry
!
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MODULE chemistry_mod

USE parameters_mod
USE time_mod
USE grid_mod

IMPLICIT NONE

PRIVATE

!
! Emission variables
!

!
! Chemistry variables
!

!
! Stuff needed for DLSODE, do not put them into the subroutine, iwork will cause problems
!
INTEGER, PARAMETER  :: neq   = 1       ! Number of equations?
INTEGER, PARAMETER  :: itol  = 1       ! so that atol is a scalar, not array
INTEGER, PARAMETER  :: itask = 1       ! for normal computation from t to tout
INTEGER, PARAMETER  :: iopt  = 1       ! for no optional inputs
INTEGER, PARAMETER  :: lrw   = 22+neq * MAX(16, neq+9) ! real workspace size
INTEGER, PARAMETER  :: liw   = 20+neq  ! integer workspace size
INTEGER, PARAMETER  :: mf    = 22      ! stiff, no user-provided jacobian
REAL(dp), PARAMETER :: rtol = 1d-5     ! relative tolerance
REAL(dp), PARAMETER :: atol = 1d-3     ! absolute tolerance

real(kind = 8), public :: foliar_density = 0.0538  ! g/cm^2
real(kind = 8), public :: emission_factor = 100    ! ng / needle_mass_in_g / h
real(kind = 8), public :: emission_activity = 1    ! NOT TAKEN INTO ACCOUNT!

REAL(dp) :: rwork(lrw)   ! real workspace
INTEGER  :: iwork(liw)   ! integer workspace


real(kind = 8), public, parameter :: M_alpha_pinene = 136.24 ! [g/mol]
real(kind = 8), public, parameter :: H_alpha_pinene = 3.0E-2 ! [M/atm]
real(kind = 8), public, parameter :: f_alpha_pinene = 0 ! [unitless]

real(kind = 8), public, parameter :: M_isoprene = 68.12 ! [g/mol]
real(kind = 8), public, parameter :: H_isoprene = 1.3E-2 ! [M/atm]
real(kind = 8), public, parameter :: f_isoprene = 0 ! [unitless]
real(kind = 8), public :: r_a
real(kind = 8), public :: r_max = 1E5 ! [s/m] maximum resistance of r_st

CONTAINS

END MODULE chemistry_mod
