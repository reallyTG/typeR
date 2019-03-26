library(eRm)


### Name: plotDIF
### Title: Confidence intervals plot of item parameter estimates.
### Aliases: plotDIF
### Keywords: models

### ** Examples

# the object used is the result of running   RM(raschdat1)
res <- raschdat1_RM_fitted     # see ? raschdat1_RM_fitted

## Not run: 
##D # LR-test on dichotomous Rasch model with user-defined split
##D splitvec <- rep(1:2, each = 50)
##D lrres <- LRtest(res, splitcr = splitvec)
##D 
##D # LR-test with mean split
##D lrres2 <- LRtest(res, split = "mean")
##D 
##D # combination of LRtest-objects in a list
##D RMplotCI <- list(lrres, lrres2)
## End(Not run)

# the object raschdat1_RM_plotDIF is the result of the computations outlined
# above and is loaded to save computation time. see ?raschdat1_RM_plotDIF
RMplotCI <- raschdat1_RM_plotDIF

# Confidence intervals plot with default assumptions
plotDIF(RMplotCI)

# Confidence intervals plot with Bonferroni correction
plotDIF(RMplotCI, gamma = (1 - (0.05/10)))

# Confidence intervals plot for an item subset
plotDIF(RMplotCI, item.subset = 1:6)

# with user defined group color and legend
plotDIF(RMplotCI, col = c("red", "blue"), leg = TRUE, legpos = "bottomright")

# with names for the splitobjects
plotDIF(RMplotCI, col = c("red", "blue"), leg = TRUE, legpos = "bottomright",
        splitnames = c(paste("User", 1:2), paste(rep("Mean", 2), 1:2)))



