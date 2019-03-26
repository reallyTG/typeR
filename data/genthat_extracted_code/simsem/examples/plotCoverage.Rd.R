library(simsem)


### Name: plotCoverage
### Title: Make a plot of confidence interval coverage rates
### Aliases: plotCoverage

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 1)
##D loading[1:6, 1] <- NA
##D LY <- bind(loading, 0.4)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # Specify both continuous sample size and percent missing completely at random. 
##D # Note that more fine-grained values of n and pmMCAR is needed, e.g., n=seq(50, 500, 1) 
##D # and pmMCAR=seq(0, 0.2, 0.01)
##D 
##D Output <- sim(NULL, n=seq(100, 200, 20), pmMCAR=c(0, 0.1, 0.2), model=CFA.Model)
##D 
##D # Plot the power of the first factor loading along the sample size value
##D plotCoverage(Output, "f1=~y1", contMCAR=FALSE)
##D plotCoverage(Output, "f1=~y1", coverValue = 0, contMCAR=FALSE)
##D 
##D # Plot the power of the correlation along the sample size and percent missing completely at random
##D plotCoverage(Output, "f1=~y1")
## End(Not run)



