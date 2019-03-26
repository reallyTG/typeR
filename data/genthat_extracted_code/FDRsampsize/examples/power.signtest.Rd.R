library(FDRsampsize)


### Name: power.signtest
### Title: Compute power of the sign test
### Aliases: power.signtest

### ** Examples

 power.signtest        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.signtest,
                  eff.size=rep(c(0.8,0.5),c(100,900)),
                  null.effect=0.5)
 res



