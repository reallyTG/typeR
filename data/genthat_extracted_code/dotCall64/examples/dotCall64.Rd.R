library(dotCall64)


### Name: dotCall64
### Title: dotCall64 - Extended Foreign Function Interface
### Aliases: dotCall64 .C64

### ** Examples

## Consider the following C function, which is included
## in the dotCall64 package:  
## void get_c(double *input, int *index, double *output) {
##     output[0] = input[index[0] - 1];
## }
##
## We can use .C64() to call get_c() from R:
.C64("get_c", SIGNATURE = c("double", "integer", "double"),
     input = 1:10, index = 9, output = double(1))$output

## Not run: 
##D ## 'input' can be a long vector
##D x_long <- double(2^31) ## requires 16 GB RAM
##D x_long[9] <- 9; x_long[2^31] <- -1
##D .C64("get_c", SIGNATURE = c("double", "integer", "double"),
##D      input = x_long, index = 9, output = double(1))$output
##D 
##D ## Since 'index' is of type 'signed int' (a 32-bit integer),
##D ## it can only address the first 2^31-1 elements of 'input'.
##D ## To also address elements beyond 2^31-1, we change the
##D ## definition of the C function as follows:
##D ## #include <stdint.h>  //  for int64_t 
##D ## void get64_c(double *input, int64_t *index, double *output) {
##D ##     output[0] = input[index[0] - 1];
##D ## }
##D 
##D ## Now, we can use .C64() to call get64_c() from R.
##D .C64("get64_c", SIGNATURE = c("double", "int64", "double"),
##D      input = x_long, index = 2^31, output = double(1))$output
##D ## Note that 2^31 is of type double and .C64() casts it into an
##D ## int64_t type before calling the C function get64_c().
##D 
##D ## The performance of the previous call can be improved by
##D ## setting additional arguments:
##D .C64("get64_c", SIGNATURE = c("double", "int64", "double"),
##D      x = x_long, i = 2^31, r = numeric_dc(1), INTENT = c("r", "r", "w"),
##D      NAOK = TRUE, PACKAGE = "dotCall64", VERBOSE = 0)$r
##D 
##D 
##D ## Consider the same function defined in Fortran:
##D ##      subroutine get64_f(input, index, output)
##D ##      double precision :: input(*), output(*)
##D ##      integer (kind = 8) :: index  ! specific to GFortran
##D ##      output(1) = input(index)
##D ##      end
##D 
##D ## The function is provided in dotCall64 and can be called with
##D .C64("get64_f", SIGNATURE = c("double", "int64", "double"),
##D      input = x_long, index = 2^31, output = double(1))$output
## End(Not run)



