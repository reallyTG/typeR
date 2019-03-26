library(demogR)


### Name: calc.ro
### Title: Caclulate net reproduction number from a demographic projection
###   matrix
### Aliases: calc.ro
### Keywords: array

### ** Examples

## Create a Leslie matrix
Px <- c(0.77, 0.95, 0.98, 0.97)
Fx <- c(0,0,1,1.2,1)
L <- odiag(Px,-1)
L[1,] <- Fx
## Calculate R_0
calc.ro(L)
## look at the fundamental matrix
calc.ro(L, N.out=TRUE)



