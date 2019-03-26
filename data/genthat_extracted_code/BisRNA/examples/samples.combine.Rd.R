library(BisRNA)


### Name: samples.combine
### Title: Combine samples p-values and ratios
### Aliases: samples.combine

### ** Examples


 ## Load data
 data(Bisdata,package="BisRNA")

 ## Obtain the ratio (Poisson parameter / coverage), and p-values
 ## adjusted for multiple testing using BH (here) or IHW method.
 lambda1 <- RNAmeth.poisson.par(Bisdata1)$estimate
 BisXP1  <- RNAmeth.poisson.test(Bisdata1,lambda1,method="BH")
 lambda2 <- RNAmeth.poisson.par(Bisdata2)$estimate
 BisXP2  <- RNAmeth.poisson.test(Bisdata2,lambda2,method="BH")
 lambda3 <- RNAmeth.poisson.par(Bisdata3)$estimate
 BisXP3  <- RNAmeth.poisson.test(Bisdata3,lambda3,method="BH")

 ## Combine samples
 BisXP.combined <- samples.combine(BisXP1,BisXP2,BisXP3)




