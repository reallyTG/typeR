library(fdapace)


### Name: CreateFuncBoxPlot
### Title: Create functional boxplot using 'bagplot', 'KDE' or 'pointwise'
###   methodology
### Aliases: CreateFuncBoxPlot

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res <- FPCA(sampWiener$Ly, sampWiener$Lt, 
            list(dataType='Sparse', error=FALSE, kernel='epan', verbose=TRUE))
CreateFuncBoxPlot(res, list(addIndx=c(1:3)) )



