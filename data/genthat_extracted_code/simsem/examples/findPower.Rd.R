library(simsem)


### Name: findPower
### Title: Find a value of independent variables that provides a given
###   value of power.
### Aliases: findPower

### ** Examples

## Not run: 
##D # Specify Sample Size by n
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, 0.4)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # Specify both sample size and percent missing completely at random. Note that more fine-grained 
##D # values of n and pmMCAR is needed, e.g., n=seq(50, 500, 1) and pmMCAR=seq(0, 0.2, 0.01)
##D Output <- sim(NULL, model=CFA.Model, n=seq(100, 200, 20), pmMCAR=c(0, 0.1, 0.2))
##D 
##D # Find the power of all possible combination of N and pmMCAR
##D pow <- getPower(Output)
##D 
##D # Find the sample size that provides the power of 0.8
##D findPower(pow, "N", 0.80)
## End(Not run)



