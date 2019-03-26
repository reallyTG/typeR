library(IsoGene)


### Name: IsoBHPlot
### Title: Plot of adjusted p-values using BH or BY adjustment
### Aliases: IsoBHPlot
### Keywords: hplot

### ** Examples

  rp <- data.frame(paste("g", 1:100), matrix(runif(500,0,1), 100, 5))
  IsoBHPlot(rp, FDR = 0.05, stat = "E2")



