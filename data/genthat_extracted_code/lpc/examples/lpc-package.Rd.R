library(lpc)


### Name: lpc-package
### Title: This package implements the Lassoed Principal Components (LPC)
###   method. It is used to compute LPC scores for each gene in a microrray
###   experiment with a survival, quantitative, or two-class outcome.
### Aliases: lpc-package lpc
### Keywords: package

### ** Examples

### Uncomment to run


#n <- 40 # 40 samples
#p <- 1000 # 1000 genes
#x <- matrix(rnorm(n*p), nrow=p) # make 40x1000 gene expression matrix
#y <-  rnorm(n) # quantitative outcome
## make first 50 genes differentially-expressed
#x[1:25,y<(-.5)] <- x[1:25,y<(-.5)]+ 1.5
#x[26:50,y<0] <- x[26:50,y<0] - 1.5
## compute LPC and T scores for each gene
#lpc.obj <- LPC(x,y, type="regression")
#lpc.obj
## Look at plot of Predictive Advantage
#pred.adv <- PredictiveAdvantage(x,y,type="regression",soft.thresh=lpc.obj$soft.thresh)
## Estimate FDRs for LPC and T scores
#fdr.lpc.out <- EstimateLPCFDR(x,y,type="regression",soft.thresh=lpc.obj$soft.thresh,nreps=50)
#fdr.lpc.out



