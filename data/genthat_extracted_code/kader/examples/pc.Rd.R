library(kader)


### Name: pc
### Title: pc
### Aliases: pc

### ** Examples

## No test: 
c0 <- expression(sqrt(5/3))
c1 <- expression(sqrt(3) - 0.01)
cgrid <- seq(1.325, 1.7, by = 0.025)
cvals <- c(eval(c0), cgrid, eval(c1))

plot(cvals, pc(cvals), xaxt = "n", xlab = "c", ylab = expression(p[c]))
axis(1, at = cvals, labels = c(c0, cgrid, c1), las = 2)
## End(No test)




