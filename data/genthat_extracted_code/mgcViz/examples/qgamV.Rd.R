library(mgcViz)


### Name: qgamV
### Title: Fit a QGAM model and get a gamViz object
### Aliases: qgamV

### ** Examples

## Not run: 
##D library(mgcViz)
##D set.seed(2) ## simulate some data...
##D dat <- gamSim(2,n=1000,dist="normal",scale=0.25)$data
##D 
##D # Fit GAM and get gamViz object
##D b <- qgamV(y~s(x) + s(z) + I(x*z), data = dat, qu = 0.2,
##D            aQgam = list(argGam = list(select = TRUE)), aViz = list("nsim" = 0))
##D 
##D # This is equivalent to doing
##D # 1. Fit QGAM
##D # b <- qgam(y~s(x) + s(z) + I(x*z), data=dat, qu = 0.2, argGam = list(select = TRUE))
##D # 2. Convert to gamViz object
##D # b <- getViz(b, nsim = 0)
##D 
##D # Either way, we all effects by doing
##D print(plot(b, allTerms = TRUE), pages = 1)
## End(Not run)




