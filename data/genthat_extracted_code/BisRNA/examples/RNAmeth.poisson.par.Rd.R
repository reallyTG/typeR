library(BisRNA)


### Name: RNAmeth.poisson.par
### Title: Find ratio (Poisson parameter / coverage) for one sample of
###   bisulfite-converted RNA
### Aliases: RNAmeth.poisson.par

### ** Examples


 ## Load data, find out ratio (Poisson parameter / coverage).
 data(Bisdata,package="BisRNA")
 lambda1 <- RNAmeth.poisson.par(Bisdata1)$estimate
 
 ## P-values adjusted for multiple testing, using either BH (here) or IHW method.
 BisXP1  <- RNAmeth.poisson.test(Bisdata1,lambda1,method="BH")

 ## Print BisXP1
 BisXP1

 ## Display BisXP1 as a data frame
 BisXP1.df <- data.frame(BisXP1$nonconv.ratio, BisXP1$pv.adj, row.names=BisXP1$RNA.pos)
 BisXP1.df




