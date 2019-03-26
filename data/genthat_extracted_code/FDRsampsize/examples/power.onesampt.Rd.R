library(FDRsampsize)


### Name: power.onesampt
### Title: Compute power of the one-sample t-test
### Aliases: power.onesampt

### ** Examples

 power.onesampt        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.onesampt,
                  eff.size=rep(c(2,0),c(100,900)),
                  null.effect=0,
                  sigma=1)
 res



