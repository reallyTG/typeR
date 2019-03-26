library(rodeo)


### Name: forcingFunctions
### Title: Generation of Forcing Functions in Fortran
### Aliases: forcingFunctions

### ** Examples

## Not run: 
##D   ! Example of a Fortran file to define functions
##D   include 'forcings.f95'   ! include generated forcings file in compilation
##D   module functions
##D   use forcings             ! make forcings available as functions
##D   implicit none
##D   contains
##D   ! ... any non-forcing functions go here ...
##D   end module
## End(Not run)

## Not run: 
##D   ! Definition of 'rexit' and 'rwarn' for testing of the generated code
##D   ! outside of R
##D   subroutine rexit (x)
##D     character(len=*), intent(in):: x
##D     write(*,*) "ERROR: ",trim(adjustl(x))
##D     stop 1
##D   end subroutine
##D   
##D   subroutine rwarn (x)
##D     character(len=*), intent(in):: x
##D     write(*,*) "WARNING: ",trim(adjustl(x))
##D   end subroutine
## End(Not run)



