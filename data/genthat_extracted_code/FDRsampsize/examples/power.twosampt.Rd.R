library(FDRsampsize)


### Name: power.twosampt
### Title: Compute power of the two-samples t-test
### Aliases: power.twosampt

### ** Examples

 power.twosampt        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.twosampt,
                  eff.size=rep(c(2,0),c(100,900)),
                  null.effect=0,
                  sigma=1)
 res



