library(FDRsampsize)


### Name: power.tcorr
### Title: Compute Power of the t-test for non-zero correlation
### Aliases: power.tcorr

### ** Examples

 power.tcorr        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.tcorr,
                  eff.size=rep(c(0.3,0),c(100,900)),
                  null.effect=0)
 res



