library(geiger)


### Name: fitContinuousMCMC
### Title: Fit models of continuous trait evolution to comparative data
###   using MCMC
### Aliases: fitContinuousMCMC

### ** Examples

## Not run: 
##D data(caniformia)
##D phy <- caniformia$phy
##D d <- caniformia$dat
##D node.priors <- caniformia$node.priors
##D root.prior <- caniformia$root.prior
##D 
##D ## as an example, we will run a very short (too short!) analysis,
##D ##fitting BM and Trend to the caniform data
##D 
##D fitContinuousMCMC(phy, d, model = "BM", Ngens = 1000, sampleFreq =100,
##D printFreq = 100, node.priors = node.priors, root.prior = root.prior,
##D outputName ="BM_caniforms")
##D 
##D fitContinuousMCMC(phy, d, model = "Trend", Ngens = 1000, sampleFreq=100,
##D printFreq = 100, node.priors = node.priors, root.prior = root.prior,
##D outputName ="Trend_caniforms")
##D 
##D bm.res <- read.table("BM_caniforms_model_params.txt", header= TRUE)
##D head(bm.res)
##D 
##D trend.res <- read.table("Trend_caniforms_model_params.txt", header= TRUE)
##D head(trend.res)
##D 
##D ### produce trace plots of logLk scores 
##D 
##D plot(bm.res$generation, bm.res$logLk, type = "l",
##D ylim = c(min(bm.res$logLk), max = max(trend.res$logLk)))
##D 
##D lines(trend.res$generation, trend.res$logLk, col = "red")
##D legend("bottomleft", c("bm", "trend"), lwd = 3, col = c("black", "red"))
## End(Not run)



