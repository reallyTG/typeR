library(FDRsampsize)


### Name: power.hart
### Title: Compute Power for RNA-seq Experiments Assuming Negative Binomial
###   Distribution.
### Aliases: power.hart

### ** Examples

 power.hart       # show the power function
 n.hart=2*(qnorm(0.975)+qnorm(0.9))^2*(1/20+0.6^2)/(log(2)^2) # Equation 6 of Hart et al
 power.hart(n.hart,0.05,log(2),20,0.6)                        # Recapitulate 90% power  
 res=fdr.sampsize(fdr=0.1,
                  ave.pow=0.8,
                  pow.func=power.hart,
                  eff.size=rep(c(log(2),0),c(100,900)),
                  null.effect=0,mu=5,sig=1)
 res



