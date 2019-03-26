library(ASSISTant)


### Name: scalarInRange
### Title: Is a scalar quantity is a specified range?
### Aliases: integerInRange numberInRange scalarInRange
###   scalarIntegerInRange
### Keywords: internal

### ** Examples

ASSISTant:::scalarInRange(x = 10, low = 2)  ## TRUE
ASSISTant:::scalarInRange(x = 10, high = 2) ## FALSE

ASSISTant:::numberInRange(x = 2:10, low = 2)  ## TRUE
ASSISTant:::numberInRange(x = 10:15, high = 2) ## FALSE

ASSISTant:::integerInRange(x = 10, low = 2)  ## TRUE
ASSISTant:::integerInRange(x = 10.5) ## FALSE

ASSISTant:::integerInRange(x = 2:10, low = 2)  ## TRUE
ASSISTant:::integerInRange(x = 10:15, high = 2) ## FALSE
ASSISTant:::integerInRange(x = c(0.5, 1.5), high = 2) ## FALSE




