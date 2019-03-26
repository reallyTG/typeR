library(EBrank)


### Name: rankEM
### Title: Empirical Bayes parameter ranking for parallel estimation
###   scenarios
### Aliases: rankEM

### ** Examples

truetheta <- c(rep(0,900),rnorm(100))
setheta <- pmax(rexp(1000,1),.1)
esttheta <- rnorm(length(truetheta),mean=truetheta,sd=setheta)
# just rank experiments that are significant at 5% FDR
stuff <- rankEM(esttheta,setheta,cutoff='f',FDR_BH=.05)
# rank all experiments (slower)
# stuff <- rankEM(esttheta,setheta,cutoff='f',FDR_BH=1)



