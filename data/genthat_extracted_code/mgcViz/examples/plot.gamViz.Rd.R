library(mgcViz)


### Name: plot.gamViz
### Title: Basic GAM plotting
### Aliases: plot.gamViz

### ** Examples

library(mgcViz)

######## Basic example
# Simulate some data and fit model
set.seed(2)  
dat <- gamSim(1,n=1e3,dist="normal",scale=2)
b <- bam(y~s(x0)+s(x1, x2)+s(x3), data=dat)
b <- getViz(b)

# Default smooth effect plotting
print(plot(b), ask = FALSE)

## Not run: 
##D # Now on one page and with out title on the second plot
##D print(plot(b) + labs(title = NULL), pages = 1) 
##D 
##D # So far we used default layers, added in the printing phase, but
##D # we might want to specify our own layers. Here we is how to do it
##D pl <- plot(b) + l_points() + l_fitLine(linetype = 3) + l_fitContour() + 
##D   l_ciLine(colour = 2) + theme_get() + labs(title = NULL)
##D print(pl, pages = 1)
##D 
##D # We might want to plot only the first smooth
##D plot(b, select = 1) + l_dens(type = "cond") + l_fitLine() + l_ciLine()
##D 
##D ######## Example with "by variable" smooth effect
##D # Simulate data and fit model
##D dat <- gamSim(4)
##D b <- gam(y ~ fac+s(x2,by=fac)+s(x0),data=dat)
##D b <- getViz(b)
##D # print() only needed because we want to plot on a single page
##D print(plot(b), pages = 1) 
##D print(plot(b, allTerms = TRUE), pages = 1) # Including also parametric effect
##D 
##D ######## Example with 3D smooth effect which cannot be plotted
##D # Simulate data and fit model
##D n <- 5e3
##D x <- rnorm(n); y <- rnorm(n); z <- rnorm(n); z2 <- rnorm(n)
##D 
##D ob <- (x-z)^2 + (y-z)^2 + z2^3 + rnorm(n)
##D b1 <- bam(ob ~ s(x, y, z) + s(z2), discrete = TRUE)
##D b1 <- getViz(b1)
##D 
##D # Only second effect get plotted
##D plot(b1)
##D # In fact this does not plot anything
##D plot(b1, select = 1)
##D # For plotting effects with more than 2D, one we need specific method. 
##D # See ?plot.mgcv.smooth.MD
##D 
##D ######## Examples about plotting parametric effects
##D # 1 Gaussian GAM
##D set.seed(3)
##D dat <- gamSim(1,n=2500,dist="normal",scale=20)
##D dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
##D dat$logi <- as.logical( sample(c(TRUE, FALSE), nrow(dat), replace = TRUE) ) 
##D bs <- "cr"; k <- 12
##D b <- bam(y ~ x0 + x1 + I(x1^2) + s(x2,bs=bs,k=k) + fac + x3:fac + I(x1*x2) + logi +
##D             s(x3, bs=bs),data=dat, discrete = TRUE)
##D b <- getViz(b)
##D 
##D # All effects in one page. Notably 'x3:fac' is missing: we have no methods
##D # for plotting second order effects.
##D print(plot(b, allTerms = TRUE), pages = 1)
##D 
##D # Plotting only parametric effects
##D print(plot(b, select = 3:9), pages = 1)
##D 
##D # 2 GAMLSS Gaussian model
##D library(mgcv);library(MASS)
##D mcycle$fac <- as.factor( sample(c("z", "k", "a", "f"), nrow(mcycle), replace = TRUE) ) 
##D b <- gam(list(accel~times + I(times^2) + s(times,k=10), ~ times + fac + s(times)),
##D           data=mcycle,family=gaulss())
##D b <- getViz(b)
##D 
##D # All effects on one page: effect of second linear predictor end with '.1'
##D print(plot(b, allTerms = TRUE), pages = 1)
## End(Not run)




