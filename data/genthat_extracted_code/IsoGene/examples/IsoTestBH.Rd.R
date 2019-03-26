library(IsoGene)


### Name: IsoTestBH
### Title: Test of monotonic trends using the five test statistics with BH
###   or BY adjustment
### Aliases: IsoTestBH
### Keywords: htest

### ** Examples

  set.seed(1234)
  rp <- data.frame(paste("g",1:100), matrix(runif(500,0,0.1), 100, 5))
  sign <- IsoTestBH(rp, FDR = 0.05, type = "BH", stat = "E2")



