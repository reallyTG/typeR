library(desire)


### Name: derringerSuich
### Title: Derringer-Suich type desirability function
### Aliases: derringerSuich
### Keywords: optimize multivariate

### ** Examples

## Simple (l, t, u, b0, b1) Derringer-Suich desirabilities:
d1 <- derringerSuich(c(0, 1, 2, 1, 1))
d2 <- derringerSuich(c(0, 1, 2, 2, 2))
d3 <- derringerSuich(c(0, 1, 2, .5, .5))

## Comparison of their shape:
opar <- par(mfrow=c(3, 1))
plot(d1)
plot(d2)
plot(d3)
par(opar)

## d/p/q/r examples:
ddesire(.2, d1, 0, 1)
pdesire(.5, d1, 0, 1)
qdesire(.8, d1, 0, 1)



