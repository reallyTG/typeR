library(IsoGene)


### Name: Isofudge
### Title: Calculation of the fudge factor for the five SAM test statistics
###   in the SAM procedure
### Aliases: Isofudge
### Keywords: htest

### ** Examples

  set.seed(1234)
  x <- c(rep(1,3),rep(2,3),rep(3,3))
  y1 <- matrix(rnorm(4500, 1,1),500,9) ## 500 genes with no trends
  y2 <- matrix(c(rnorm(1500, 1,1),rnorm(1500,2,1),
    rnorm(1500,3,1)),500,9) ## 500 genes with increasing trends
  y <- data.frame(rbind(y1, y2)) ##y needs to be a data frame
  fudge.factor <- Isofudge(x,y)



