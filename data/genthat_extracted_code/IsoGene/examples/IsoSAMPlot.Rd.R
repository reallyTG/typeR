library(IsoGene)


### Name: IsoSAMPlot
### Title: Plots produced using the SAM procedure
### Aliases: IsoSAMPlot
### Keywords: hplot

### ** Examples

  set.seed(1234)
 ## No test: 
  x <- c(rep(1,3),rep(2,3),rep(3,3))
  y1 <- matrix(rnorm(4500, 1,1),500,9) ## 500 genes with no trends
  y2 <- matrix(c(rnorm(1500, 1,1),rnorm(1500,2,1),
     rnorm(1500,3,1)),500,9) ## 500 genes with increasing trends
  y <- data.frame(rbind(y1, y2)) ##y needs to be a data frame
  qqstat <- Isoqqstat(x, y, fudge="pooled", niter=50)
  allfdr <- Isoallfdr(qqstat, , stat = "E2")
  IsoSAMPlot(qqstat, allfdr, FDR = 0.1, stat = "E2")
## End(No test)



