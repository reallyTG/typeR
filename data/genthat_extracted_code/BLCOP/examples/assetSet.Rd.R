library(BLCOP)


### Name: Extractors
### Title: Extract various fields of view or posterior objects
### Aliases: assetSet PMatrix confidences viewMatrix posteriorMeanCov
###   posteriorSimulations numSimulations priorViews
### Keywords: utilities

### ** Examples

    pick <- matrix(0, ncol = 4, nrow = 1, dimnames = list(NULL, c("SP", "FTSE", "CAC", "DAX")))
    pick[1,4] <- 1
    vdist <- list(distribution("unif", min = -0.02, max = 0))
    views <- COPViews(pick, vdist, 0.2, c("SP", "FTSE", "CAC", "DAX"))
    assetSet(views)
    confidences(views)
    PMatrix(views)




