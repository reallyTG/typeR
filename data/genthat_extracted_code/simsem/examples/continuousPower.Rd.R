library(simsem)


### Name: continuousPower
### Title: Find power of model parameters when simulations have randomly
###   varying parameters
### Aliases: continuousPower

### ** Examples

## Not run: 
##D # Specify Sample Size by n
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, 0.7)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D dat <- generate(CFA.Model, 50)
##D out <- analyze(CFA.Model, dat)
##D 
##D # Specify both continuous sample size and percent missing completely at random. 
##D # Note that more fine-grained values of n and pmMCAR is needed, e.g., n=seq(50, 500, 1) 
##D # and pmMCAR=seq(0, 0.2, 0.01)
##D Output <- sim(NULL, CFA.Model, n=seq(100, 200, 20), pmMCAR=c(0, 0.1, 0.2))
##D summary(Output)
##D 
##D # Find the power of all combinations of different sample size and percent MCAR missing
##D Cpow <- continuousPower(Output, contN = TRUE, contMCAR = TRUE)
##D Cpow
##D 
##D # Find the power of parameter estimates when sample size is 200 and percent MCAR missing is 0.3
##D Cpow2 <- continuousPower(Output, contN = TRUE, contMCAR = TRUE, pred=list(N = 200, pmMCAR = 0.3))
##D Cpow2
## End(Not run)



