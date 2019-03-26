library(StratigrapheR)


### Name: tie.lim
### Title: Discretises lim objects
### Aliases: tie.lim

### ** Examples

l  <- matrix(1:30, ncol = 3, byrow = FALSE)
r  <- matrix(2:31, ncol = 3, byrow = FALSE)
id <- matrix(rep(c("C1", "C2", "C3"),10), ncol = 3, byrow = TRUE)
y  <- matrix(rep(1:10,3), ncol = 3, byrow = FALSE)
xout <- seq(-2,32,0.5)

res  <- tie.lim(l = l, r = r,  y = y, xout = xout, id = id)

cont <- tie.lim(l = l, r = r,  y = y, id = id)

plot(res$x, res$y, pch = 19, col = "red")

lines(cont$x[,1], cont$y[,1])
lines(cont$x[,2], cont$y[,2])
lines(cont$x[,3], cont$y[,3])




