library(FDRsampsize)


### Name: power.cox
### Title: Compute the power of a single-predictor Cox regression model
### Aliases: power.cox

### ** Examples

 power.cox             # show the power.cox function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.cox,
                  eff.size=rep(c(log(2),0),c(100,900)),
                  null.effect=0,
                  v=1)
 res



