library(desire)


### Name: normMax
### Title: Normal Distribution based desirability functions.
### Aliases: normMax normMin normTarget
### Keywords: optimize multivariate

### ** Examples

## Create desirability functions:
d1 <- normMin(-1, 1)
d2 <- normMax(-1, 1)
d3 <- normTarget(-1, 0, 1)

## Show shape of desirability function:
opar <- par(mfrow=c(3,1))
plot(d1)
plot(d2)
plot(d3)
par(opar)

## Show 
dsplot(log(x), d1, .5, 2)
dsplot(sin(x), d2, -pi, pi)
dsplot(cos(x), d3, 0, 2*pi)



