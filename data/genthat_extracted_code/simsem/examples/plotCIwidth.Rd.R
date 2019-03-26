library(simsem)


### Name: plotCIwidth
### Title: Plot a confidence interval width of a target parameter
### Aliases: plotCIwidth

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 2)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loadingValues <- matrix(0, 6, 2)
##D loadingValues[1:3, 1] <- 0.7
##D loadingValues[4:6, 2] <- 0.7
##D LY <- bind(loading, loadingValues)
##D latent.cor <- matrix(NA, 2, 2)
##D diag(latent.cor) <- 1
##D RPS <- binds(latent.cor, 0.5)
##D error.cor <- matrix(0, 6, 6)
##D diag(error.cor) <- 1
##D RTE <- binds(error.cor)
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output <- sim(5, n=200, model=CFA.Model) 
##D 
##D # Plot the widths of factor correlation
##D plotCIwidth(Output, "f1~~f2", assurance = 0.80)
##D 
##D # The example of continous varying sample size. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output2 <- sim(NULL, n=seq(450, 500, 10), model=CFA.Model)
##D 
##D # Plot the widths along sample size value
##D plotCIwidth(Output2, "f1~~f2", assurance = 0.80)
##D 
##D # Specify both continuous sample size and percent missing completely at random. 
##D # Note that more fine-grained values of n and pmMCAR is needed, e.g., n=seq(50, 500, 1) 
##D # and pmMCAR=seq(0, 0.2, 0.01)
##D Output3 <- sim(NULL, n=seq(450, 500, 10), pmMCAR=c(0, 0.05, 0.1, 0.15), model=CFA.Model)
##D 
##D # Plot the contours that each contour represents the value of widths at each level
##D # of sample size and percent missing completely at random
##D plotCIwidth(Output3, "f1~~f2", assurance = 0.80)
## End(Not run)



