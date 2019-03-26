library(bcp)


### Name: summary.bcp
### Title: Summarizing Bayesian change point analysis results
### Aliases: summary.bcp print.bcp
### Keywords: datasets

### ** Examples

##### A random sample from a few normal distributions #####
testdata <- c(rnorm(50), rnorm(50, 5, 1), rnorm(50))
bcp.0 <- bcp(testdata)
summary(bcp.0)
plot(bcp.0, main="Univariate Change Point Example")

##### An MCMC summary from the ``coda'' package #####
## Not run: 
##D if (require("coda")) {
##D   bcp.0 <- bcp(testdata, return.mcmc=TRUE)
##D   bcp.mcmc <- as.mcmc(t(bcp.0$mcmc.means))
##D   summary(bcp.mcmc)
##D   heidel.diag(bcp.mcmc) # an example convergence diagnostic
##D   # from the coda package.
##D }
## End(Not run)



