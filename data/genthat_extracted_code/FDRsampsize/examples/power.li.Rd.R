library(FDRsampsize)


### Name: power.li
### Title: Compute Power for RNA-Seq Experiments Assuming Poisson
###   Distribution
### Aliases: power.li

### ** Examples

 power.li      # show the power function
 power.li(88,0.05,1.25,5,0.5,"w")  # recapitulate 80% power in Table 1 of Li et al (2013)
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.li,
                  eff.size=rep(c(1.5,1),c(100,900)),
                  null.effect=1,
                  mu0=5,w=1,type="w")
 res



