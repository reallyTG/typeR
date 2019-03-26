library(fdapace)


### Name: CreateDiagnosticsPlot
### Title: Functional Principal Component Analysis Diagnostics plot
### Aliases: CreateDiagnosticsPlot plot.FPCA

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res1 <- FPCA(sampWiener$Ly, sampWiener$Lt, 
            list(dataType='Sparse', error=FALSE, kernel='epan', verbose=FALSE))
plot(res1)



