library(fdapace)


### Name: CreatePathPlot
### Title: Create the fitted sample path plot based on the results from
###   FPCA().
### Aliases: CreatePathPlot

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res <- FPCA(sampWiener$Ly, sampWiener$Lt, 
            list(dataType='Sparse', error=FALSE, kernel='epan',
            verbose=TRUE))
CreatePathPlot(res, subset=1:5)

# CreatePathPlot has a lot of usages:
## Not run: 
##D CreatePathPlot(res)
##D CreatePathPlot(res, 1:20)
##D CreatePathPlot(res, 1:20, showObs=FALSE)
##D CreatePathPlot(res, 1:20, showMean=TRUE, showObs=FALSE)
##D CreatePathPlot(res, 1:20, obsOnly=TRUE)
##D CreatePathPlot(res, 1:20, obsOnly=TRUE, showObs=FALSE)
##D CreatePathPlot(inputData=sampWiener, subset=1:20, obsOnly=TRUE)
## End(Not run)




