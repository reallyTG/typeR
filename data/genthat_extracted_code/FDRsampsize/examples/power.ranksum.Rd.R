library(FDRsampsize)


### Name: power.ranksum
### Title: Compute power of the rank-sum test
### Aliases: power.ranksum

### ** Examples

 power.ranksum        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.ranksum,
                  eff.size=rep(c(0.8,0.5),c(100,900)),
                  null.effect=0.5)
 res



