library(DiscreteWeibull)


### Name: Edweibull
### Title: Expected values
### Aliases: Edweibull E2dweibull Vdweibull ERdweibull
### Keywords: distribution

### ** Examples

q <- 0.75
beta <- 1.25
Edweibull(q, beta)
E2dweibull(q, beta)
Vdweibull(q, beta)
ERdweibull(q, beta)
# if beta=0.75...
beta <- 0.75
Edweibull(q, beta)
Edweibull(q, beta, nmax=100)
# here above, the approximation through the continuous model intervenes
# if beta=1...
beta <- 1
Edweibull(q, beta)
# which equals...
1/(1-q)



