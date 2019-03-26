library(tcpl)


### Name: tcplAddModel
### Title: Draw a tcpl Model onto an existing plot
### Aliases: tcplAddModel

### ** Examples

## Create some dummy data to plot
logc <- 1:10
r1 <- sapply(logc, tcplHillVal, ga = 5, tp = 50, gw = 0.5)
r2 <- log2(sapply(logc, tcplHillVal, ga = 4, tp = 30, gw = 0.5))
p1 <- tcplFit(logc = logc, resp = r1, bmad = 10)
p2 <- tcplFit(logc = logc, resp = r2, bmad = log2(1.5))

## In the dummy data above, the two plots are on very different scales
plot(r1 ~ logc, pch = 16, ylab = "raw response")
tcplAddModel(pars = p1, modl = "hill")
points(r2 ~ logc)
tcplAddModel(pars = p2, modl = "hill", lty = "dashed")

## To visualize the two curves on the same plot for comparison, we can 
## scale the values to the bmad, such that a scaled response of 1 will equal
## the bmad for each curve.
plot(r1/10 ~ logc, pch = 16, ylab = "scaled response")
tcplAddModel(pars = p1, modl = "hill", adj = 1/10)
points(r2/log2(5) ~ logc)
tcplAddModel(pars = p2, modl = "hill", adj = 1/log2(5), lty = "dashed")




