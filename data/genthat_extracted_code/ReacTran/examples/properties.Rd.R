library(ReacTran)


### Name: p.exp
### Title: Common Properties with Distance, to be used with setup.prop.1D
### Aliases: p.exp p.lin p.sig
### Keywords: utilities

### ** Examples


x <- seq(0, 5, len = 100)
plot(x, p.exp(x, x.L = 2), 
     xlab = "x.coordinate", ylab = "y value", ylim = c(0, 1))
lines(x, p.lin(x, x.L = 2), col = "blue")
lines(x, p.sig(x, x.L = 2), col = "red")



