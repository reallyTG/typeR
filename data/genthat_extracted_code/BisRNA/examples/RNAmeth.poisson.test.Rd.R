library(BisRNA)


### Name: RNAmeth.poisson.test
### Title: Test RNA Cytosine methylation based on Poisson model
###   distribution
### Aliases: RNAmeth.poisson.test

### ** Examples


 ## Load data, find out ratio Poison parameter / coverage,
 ## and produce corresponding adjusted p-values.
 data(Bisdata,package="BisRNA")
 lambda1 <- RNAmeth.poisson.par(Bisdata1)$estimate
 BisXP1  <- RNAmeth.poisson.test(Bisdata1,lambda1,method="BH")

 ## Print BisXP1
 BisXP1

 ## Display BisXP1 as a data frame
 BisXP1.df <- data.frame(BisXP1$nonconv.ratio, BisXP1$pv.adj, row.names=BisXP1$RNA.pos)
 BisXP1.df




