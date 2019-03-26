library(BisRNA)


### Name: BisRNA-package
### Title: Analysis of RNA Cytosine-5 Methylation from bisulfite sequencing
###   experiments
### Aliases: BisRNA BisRNA-package

### ** Examples


 ## Load data
 data(Bisdata,package="BisRNA")

 ## Ratio (Poisson parameter / coverage), derived p-values, 
 #  adjusted for multiple testing using either BH (here), or IHW if available.
 lambda1 <- RNAmeth.poisson.par(Bisdata1)$estimate
 BisXP1  <- RNAmeth.poisson.test(Bisdata1,lambda1,method="BH")
 #
 lambda2 <- RNAmeth.poisson.par(Bisdata2)$estimate
 BisXP2  <- RNAmeth.poisson.test(Bisdata2,lambda2,method="BH")
 #
 lambda3 <- RNAmeth.poisson.par(Bisdata3)$estimate
 BisXP3  <- RNAmeth.poisson.test(Bisdata3,lambda3,method="BH")

 ## Combined p-values ; median and standard error of
 ## bisulfite non-conversion ratio
 BisXP.combined <- samples.combine(BisXP1,BisXP2,BisXP3)



