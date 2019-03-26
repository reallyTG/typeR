library(fdapace)


### Name: CreateBWPlot
### Title: Functional Principal Component Analysis Bandwidth Diagnostics
###   plot
### Aliases: CreateBWPlot

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res1 <- FPCA(sampWiener$Ly, sampWiener$Lt, 
            list(dataType='Sparse', error=FALSE, kernel='epan', verbose=FALSE))
CreateBWPlot(res1)



