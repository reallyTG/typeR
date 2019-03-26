library(FDRsampsize)


### Name: power.oneway
### Title: Compute power of one-way ANOVA
### Aliases: power.oneway

### ** Examples

 power.oneway        # show the power function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.oneway,
                  eff.size=rep(c(2,0),c(100,900)),
                  null.effect=0,
                  k=3)
 res



