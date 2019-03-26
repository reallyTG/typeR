library(QCApro)


### Name: implicantMatrix
### Title: Create Implicant Matrices
### Aliases: implicantMatrix
### Keywords: functions

### ** Examples

# three exogenous factors with two levels each;
# first row is empty set
implicantMatrix(noflevels = rep(2, 3))

# two exogenous factors with three levels each
implicantMatrix(noflevels = rep(3, 2))

# arranged differently
implicantMatrix(noflevels = rep(3, 2), arrange = TRUE)

# with internal indicator for eliminated values
implicantMatrix(noflevels = rep(3, 2), raw = TRUE)



