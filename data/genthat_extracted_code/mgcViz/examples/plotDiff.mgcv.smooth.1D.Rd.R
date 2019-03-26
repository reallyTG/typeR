library(mgcViz)


### Name: plotDiff.mgcv.smooth.1D
### Title: Plotting differences between two 1D smooth effects
### Aliases: plotDiff.mgcv.smooth.1D

### ** Examples

# Simulate data and add factors uncorrelated to the response
library(mgcViz)
set.seed(6898)
dat <- gamSim(1,n=1500,dist="normal",scale=20)
dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) ) 
bs <- "cr"; k <- 12
b <- gam(y ~ s(x2,bs=bs,by = fac), data=dat)
o <- getViz(b, nsim = 0)

# Extract the smooths correspoding to "A1" and "A2" and plot their differences
# with credible intervals
plotDiff(s1 = sm(o, 1), s2 = sm(o, 2)) + l_ciPoly() + 
  l_fitLine() + geom_hline(yintercept = 0, linetype = 2)
  



