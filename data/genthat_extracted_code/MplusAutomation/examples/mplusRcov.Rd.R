library(MplusAutomation)


### Name: mplusRcov
### Title: Create Mplus code for various residual covariance structures.
### Aliases: mplusRcov
### Keywords: interface

### ** Examples

# all five structures collapsing
mplusRcov(letters[1:4], "homogenous", "rho", "e", TRUE)
mplusRcov(letters[1:4], "heterogenous", "rho", "e", TRUE)
mplusRcov(letters[1:4], "cs", "rho", "e", TRUE)
mplusRcov(letters[1:4], "toeplitz", "rho", "e", TRUE)
mplusRcov(letters[1:4], "ar", "rho", "e", TRUE)
mplusRcov(letters[1:4], "un", "rho", "e", TRUE)

# all five structures without collapsing
# useful for long names or many variables
# where a line may cross 80 characters
mplusRcov(letters[1:4], "homogenous", "rho", "e", FALSE)
mplusRcov(letters[1:4], "heterogenous", "rho", "e", FALSE)
mplusRcov(letters[1:4], "cs", "rho", "e", FALSE)
mplusRcov(letters[1:4], "toeplitz", "rho", "e", FALSE)
mplusRcov(letters[1:4], "ar", "rho", "e", FALSE)
mplusRcov(letters[1:4], "un", "rho", "e", FALSE)



