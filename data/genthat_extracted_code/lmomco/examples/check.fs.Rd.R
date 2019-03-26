library(lmomco)


### Name: check.fs
### Title: Check Vector of Nonexceedance Probabilities
### Aliases: check.fs
### Keywords: utility (probability)

### ** Examples

F <- c(0.5,0.7,0.9,1.1)
if(check.fs(F) == FALSE) cat("Bad nonexceedances 0<F<1\n")



