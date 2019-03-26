library(kader)


### Name: J2
### Title: J2
### Aliases: J2

### ** Examples

## No test: 
u <- seq(0, 1, by = 0.01)
c0 <- expression(sqrt(3) + 0.01)
c1 <- expression(sqrt(5))
cgrid <- seq(1.85, 2.15, by = 0.1)
cvals <- c(eval(c0), cgrid, eval(c1))

Y <- sapply(cvals, function(cc, u) J2(u, cc = cc), u = u)
cols <- rainbow(ncol(Y), end = 9/12)
matplot(u, Y, type = "l", lty = "solid", col = cols,
  ylab = expression(J[2](u, c)))
abline(h = 0)
legend("topleft", title = "c", legend = c(c0, cgrid, c1),
  lty = 1, col = cols, cex = 0.8)
## End(No test)




