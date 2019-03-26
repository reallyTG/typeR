library(fdapace)


### Name: CreateCovPlot
### Title: Create the covariance surface plot based on the results from
###   FPCA() or FPCder().
### Aliases: CreateCovPlot

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res <- FPCA(sampWiener$Ly, sampWiener$Lt, 
            list(dataType='Sparse', error=FALSE, kernel='epan', verbose=TRUE))
CreateCovPlot(res)



