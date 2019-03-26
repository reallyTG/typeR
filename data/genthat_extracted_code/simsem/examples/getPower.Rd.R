library(simsem)


### Name: getPower
### Title: Find power of model parameters
### Aliases: getPower

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, 0.7)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # Specify both sample size and percent missing completely at random. Note that more fine-grained 
##D # values of n and pmMCAR is needed, e.g., n=seq(50, 500, 1) and pmMCAR=seq(0, 0.2, 0.01)
##D Output <- sim(NULL, model=CFA.Model, n=seq(100, 200, 20), pmMCAR=c(0, 0.1, 0.2))
##D summary(Output)
##D 
##D # Get the power of all possible combinations of n and pmMCAR
##D getPower(Output)
##D 
##D # Get the power of the combinations of n of 100 and 200 and pmMCAR of 0, 0.1, and 0.2
##D getPower(Output, nVal=c(100, 200), pmMCARval=c(0, 0.1, 0.2))
## End(Not run)



