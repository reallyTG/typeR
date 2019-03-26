library(mgcViz)


### Name: pterm
### Title: Extracting parametric effects from a GAM model
### Aliases: pterm

### ** Examples

####### 1. Gaussian GAM 
library(mgcViz)
set.seed(3)
dat <- gamSim(1,n=1500,dist="normal",scale=20)
dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) ) 
bs <- "cr"; k <- 12
b <- gam(y ~ x0 + x1 + I(x1^2) + s(x2,bs=bs,k=k) + fac + x3:fac + I(x1*x2) + logi,data=dat)
o <- getViz(b)

# Plot effect of 'x0'
pt <- pterm(o, 1)
plot(pt, n = 60) + l_ciPoly() + l_fitLine() + l_ciLine() + l_points()

## Not run: 
##D # Plot effect of 'x3'
##D pt <- pterm(o, 1)
##D plot(pt, n = 60) + l_fitLine() + l_ciLine(colour = 2)
##D 
##D # Plot effect of 'fac'
##D pt <- pterm(o, 4)
##D plot(pt) + l_ciBar(colour = "blue") + l_fitPoints(colour = "red") + 
##D            l_rug(alpha = 0.3)
##D 
##D # Plot effect of 'logi'
##D pt <- pterm(o, 6)
##D plot(pt) + l_fitBar(a.aes = list(fill = I("light blue"))) + l_ciBar(colour = "blue")
##D 
##D # Plot effect of 'x3:fac': no method available yet available for second order terms
##D pt <- pterm(o, 7)
##D plot(pt)
##D 
##D ####### 1. Continued: Quantile GAMs
##D b <- mqgamV(y ~ x0 + x1 + I(x1^2) + s(x2,bs=bs,k=k) + x3:fac + 
##D               I(x1*x2) + logi, data=dat, qu = c(0.3, 0.5, 0.8))
##D 
##D plot(pterm(b, 3)) + l_ciBar(colour = 2) + l_fitPoints()
##D 
##D plot(pterm(b, 4)) + l_fitBar(colour = "blue", fill = 3) + l_ciBar(colour = 2) 
##D 
##D # Don't know how to plot this interaction
##D plot(pterm(b, 6))
##D  
##D ####### 2. Gaussian GAMLSS model
##D library(MASS)
##D mcycle$fac <- as.factor( sample(c("z", "k", "a", "f"), nrow(mcycle), replace = TRUE) ) 
##D b <- gam(list(accel~times + I(times^2) + s(times,k=10), ~ times + fac + s(times)),
##D           data=mcycle,family=gaulss(), optimizer = "efs")
##D o <- getViz(b)
##D 
##D # Plot effect of 'I(times^2)' on mean: notice that partial residuals
##D # are unavailable for GAMLSS models, hence l_point does not do anything here.
##D pt <- pterm(o, 2)
##D plot(pt) + l_ciPoly() + l_fitLine() + l_ciLine() + l_points()
##D 
##D # Plot effect of 'times' in second linear predictor.
##D # Notice that partial residuals are unavailable.
##D pt <- pterm(o, 3)
##D plot(pt) + l_ciPoly() + l_fitLine() + l_ciLine(linetype = 3) + l_rug()
##D 
##D # Plot effect of 'fac' in second linear predictor.
##D pt <- pterm(o, 4)
##D plot(pt) + l_ciBar(colour = "blue") + l_fitPoints(colour = "red") + 
##D            l_rug() 
## End(Not run)



