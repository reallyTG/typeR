library(mgcViz)


### Name: plot.multi.ptermFactor
### Title: Plotting factor or logical parametric effects
### Aliases: plot.multi.ptermFactor plot.multi.ptermLogical
###   plot.ptermFactor plot.ptermLogical

### ** Examples

# Simulate data and fit GAM
set.seed(3)
dat <- gamSim(1,n=2000,dist="normal",scale=20)
dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) )
dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) )
bs <- "cr"; k <- 12
b <- gam(y~fac + s(x0) + s(x1) + s(x2) + s(x3) + logi, data=dat)
o <- getViz(b, nsim = 0)

# Extract factor terms and plot it
pt <- pterm(o, 1)
plot(pt) + l_ciBar() + l_fitPoints(colour = 2) + l_rug(alpha = 0.2)

# Use barplot instead of points
pt <- pterm(o, 1)
plot(pt) + l_fitBar() + l_ciBar()

# Same with binary varible
pt <- pterm(o, 2)
plot(pt) + l_fitPoints() + l_ciBar()




