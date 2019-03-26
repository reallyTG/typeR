library(IsoGene)


### Name: Isoqval
### Title: Obtaining the list of significant genes using the SAM procedure
### Aliases: Isoqval
### Keywords: htest

### ** Examples

  set.seed(1234)
 ## No test: 
  x <- c(rep(1,3),rep(2,3),rep(3,3))
  y1 <- matrix(rnorm(4500, 1,1),500,9) ## 500 genes with no trends
  y2 <- matrix(c(rnorm(1500, 1,1),rnorm(1500,2,1),
    rnorm(1500,3,1)),500,9) ## 500 genes with increasing trends
  y <- data.frame(rbind(y1, y2)) ##y needs to be a data frame
  qqstat <- Isoqqstat(x, y, fudge="pooled", niter=50)
  allfdr <- Isoallfdr(qqstat, ,stat="E2")
  qval <- Isoqval(delta=0.2, allfdr, qqstat, stat="E2")
## End(No test)



