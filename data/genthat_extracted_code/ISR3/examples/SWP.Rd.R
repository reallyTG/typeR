library(ISR3)


### Name: SWP
### Title: Sweep Function
### Aliases: SWP

### ** Examples

set.seed(100)
# generate a symmetric positive definite matrix
Sigma <- rWishart(1,4,diag(3))[,,1]
# sweep all the columns to produce the inverse
Sigma.inv <- SWP(Sigma,1:3)



