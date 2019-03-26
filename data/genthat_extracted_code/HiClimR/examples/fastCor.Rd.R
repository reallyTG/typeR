library(HiClimR)


### Name: fastCor
### Title: Fast correlation for large matrices
### Aliases: fastCor
### Keywords: HiClimR

### ** Examples

require(HiClimR)

## Load test case data
x <- TestCase$x

## Use fastCor function to compute the correlation matrix
t0 <- proc.time() ; xcor <- fastCor(t(x)) ; proc.time() - t0
## compare with cor function
t0 <- proc.time() ; xcor0 <- cor(t(x)) ; proc.time() - t0

## Not run: 
##D 
##D ## Split the data into 10 splits and return upper-triangular half only
##D xcor10 <- fastCor(t(x), nSplit = 10, upperTri = TRUE)
##D 
## End(Not run)



