library(FDRsampsize)


### Name: fdr.sampsize
### Title: Determine sample size required to achieve a desired average
###   power while controlling the FDR at a specified level.
### Aliases: fdr.sampsize print.fdr.sampsize

### ** Examples

 power.twosampt             # show the power.cox function
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.twosampt,
                  eff.size=rep(c(1,0),c(10,990)),
                  null.effect=0)
 res
 


