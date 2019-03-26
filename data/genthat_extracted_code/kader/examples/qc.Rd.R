library(kader)


### Name: qc
### Title: qc
### Aliases: qc

### ** Examples

## No test: 
u <- c(0, 1)   # seq(0, 1, by = 0.1)
c0 <- expression(sqrt(5/3))
c1 <- expression(sqrt(3) - 0.05)
cgrid <- seq(1.4, 1.6, by = 0.1)
cvals <- c(eval(c0), cgrid, eval(c1))

Y <- sapply(cvals, function(cc, u) qc(u, cc = cc), u = u)
cols <- rainbow(ncol(Y), end = 9/12)
matplot(u, Y, type = "l", lty = "solid", col = cols,
  ylab = expression(q[c](u)))
abline(h = 0, lty = "dashed")
legend("topright", title = "c", legend = c(c0, cgrid, c1),
  lty = 1, col = cols, cex = 0.8)
## End(No test)




