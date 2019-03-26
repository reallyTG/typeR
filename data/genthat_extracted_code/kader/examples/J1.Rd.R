library(kader)


### Name: J1
### Title: J1
### Aliases: J1

### ** Examples

## No test: 
u <- seq(0, 1, by = 0.01)
c0 <- expression(sqrt(5/3))
c1 <- expression(sqrt(3) - 0.01)
cgrid <- c(1.35, seq(1.4, 1.7, by = 0.1))
cvals <- c(eval(c0), cgrid, eval(c1))

Y <- sapply(cvals, function(cc, u) J1(u, cc = cc), u = u)
cols <- rainbow(ncol(Y), end = 9/12)
matplot(u, Y, type = "l", lty = "solid", col = cols,
  ylab = expression(J[1](u, c)))
abline(h = 0)
legend("topleft", title = "c", legend = c(c0, cgrid, c1),
  lty = 1, col = cols, cex = 0.8)
## End(No test)




