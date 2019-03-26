library(ISR3)


### Name: RSWP
### Title: Reverse Sweep Function
### Aliases: RSWP

### ** Examples

set.seed(100)
# generate symmetric positive definite matrix
Sigma <- rWishart(1,4,diag(3))[,,1]
# sweep all the columns to produce the inverse
# and then reverse sweep them all back to Sigma
Sigma2 <- RSWP(SWP(Sigma,1:3),1:3)



