library(fdapace)


### Name: CreateOutliersPlot
### Title: Functional Principal Component or Functional Singular Value
###   Decomposition Scores Plot using 'bagplot' or 'KDE' methodology
### Aliases: CreateOutliersPlot

### ** Examples

## Not run: 
##D set.seed(1)
##D n <- 420
##D pts <- seq(0, 1, by=0.05)
##D sampWiener <- Wiener(n, pts)
##D sampWiener <- Sparsify(sampWiener, pts, 10)
##D res <- FPCA(sampWiener$Ly, sampWiener$Lt, 
##D             list(dataType='Sparse', error=FALSE, kernel='epan', verbose=TRUE))
##D CreateOutliersPlot(res)
## End(Not run)



