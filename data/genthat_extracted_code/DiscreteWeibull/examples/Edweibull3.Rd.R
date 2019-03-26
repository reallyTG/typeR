library(DiscreteWeibull)


### Name: Edweibull3
### Title: Expected values
### Aliases: Edweibull3 E2dweibull3
### Keywords: distribution

### ** Examples

c <- 0.4
beta <- 0.25
Edweibull3(c,beta)
c <- 0.4
beta <- -0.75
Edweibull3(c, beta) # may require too much time
Edweibull3(c, beta, eps=0.001) # try with a smaller eps->worse approximation
c <- rep(0.1, 11)
beta <- (0:10)/10
Edweibull3(c, beta)
c <- rep(0.5, 11)
beta <- (-5:5)/10
Edweibull3(c,beta)
# E2dweibull3
c <- 0.4
beta <- 0.25
E2dweibull3(c, beta)
c <- rep(0.1, 11)
beta <- (0:10)/10
Edweibull3(c, beta)
c <- rep(0.8, 11)
beta <- (-5:5)/11
E2dweibull3(c, beta)



