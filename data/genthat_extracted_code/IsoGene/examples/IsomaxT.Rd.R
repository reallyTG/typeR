library(IsoGene)


### Name: IsomaxT
### Title: The maxT procedure for order restricted inference
### Aliases: IsomaxT
### Keywords: htest

### ** Examples

 ## No test: 
  x.res <- c(rep(1,3),rep(2,3),rep(3,3))
  y1 <- matrix(rnorm(90, 1,1),10,9)  # 10 genes with no trends
  y2 <- matrix(c(rnorm(30, 1,1), rnorm(30,2,1),
                 rnorm(30,3,1)), 10, 9)  # 10 genes with increasing trends
  dat.mat <- data.frame(rbind(y1, y2))  # y needs to be a data frame  
  niter=1000 
  
  set.seed(1234)
  pval.maxT <- IsomaxT(x.res, dat.mat,niter)
## End(No test)



