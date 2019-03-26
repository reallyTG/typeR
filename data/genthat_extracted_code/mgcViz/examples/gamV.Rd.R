library(mgcViz)


### Name: bamV
### Title: Fit a GAM model and get a gamViz object
### Aliases: bamV gamV

### ** Examples

##### gam example
# Simulate data
library(mgcViz)
set.seed(2) ## simulate some data...
dat <- gamSim(1,n=1000,dist="normal",scale=2)

# Fit GAM and get gamViz object
b <- gamV(y~s(x0)+s(x1, x2)+s(x3), data = dat, 
          aGam = list(scale = 2), aViz = list("nsim" = 20))

# This is equivalent to doing
# 1. Fit GAM
# b <- gam(y~s(x0)+s(x1, x2)+s(x3), data=dat, method="REML", scale = 2)
# 2. Convert to gamViz object
# b <- getViz(b, nsim = 20)

# Either way, we plot first and third effects by doing
print(plot(b, select = c(1, 3)), pages = 1)

## Not run: 
##D ##### bam example
##D # Simulate data
##D library(mgcViz)
##D set.seed(2) ## simulate some data...
##D dat <- gamSim(1,n=2000,dist="normal",scale=2)
##D 
##D # Fit using bam() and get gamViz object
##D b <- bamV(y~s(x0)+s(x1, x2)+s(x3), data = dat, 
##D           aGam = list(discrete = TRUE), aViz = list("nsim" = 0))
##D           
##D # Either way, we plot first and third effects by doing
##D print(plot(b, select = c(2)), pages = 1)
## End(Not run)



