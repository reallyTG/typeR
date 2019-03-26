library(EurosarcBayes)


### Name: bayes_binom_one_postprob_nstage
### Title: Single arm, any stage, cut-point calculator using posterior
###   probabilities to make the cuts.
### Aliases: bayes_binom_one_postprob_nstage

### ** Examples

reviews=c(7,18)
eta=c(0.9,0.9)
zeta=c(0.9,0.9)
p0=0.1
p1=0.3
prior.a=0
prior.b=0
bayes_binom_one_postprob_nstage(reviews,eta,zeta,p0,p1,prior.a,
prior.b)



