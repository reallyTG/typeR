library(discreteRV)


### Name: SofIID
### Title: Sum of independent identically distributed random variables
### Aliases: SofIID

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))

S5 <- SofIID(X.Bern, 5)
S128 <- SofIID(X.Bern, 128)



