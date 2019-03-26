library(mgcViz)


### Name: plot.multi.ptermNumeric
### Title: Plotting numeric parametric effects
### Aliases: plot.multi.ptermNumeric plot.ptermNumeric

### ** Examples

# Simulate data and fit GAM
set.seed(3)
dat <- gamSim(1,n=2000,dist="normal",scale=20)
bs <- "cr"; k <- 12
b <- gam(y ~  x0 + x1 + I(x1^2) + s(x2,bs=bs,k=k) + 
              I(x1*x2) + s(x3, bs=bs), data=dat)
o <- getViz(b, nsim = 0)

# Extract first terms and plot it
pt <- pterm(o, 1)
plot(pt, n = 60) + l_ciPoly() + l_fitLine() + l_ciLine()

# Extract I(x1^2) terms and plot it with partial residuals
pt <- pterm(o, 3)
plot(pt, n = 60) + l_ciPoly() + l_fitLine() + l_ciLine() + l_points()




