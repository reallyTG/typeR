library(EurosarcBayes)


### Name: bayes_binom_one_postlike_nstage
### Title: Single arm, any stage, cut-point calculator us posterior
###   predictive distribution of a successful trial occurring to make the
###   cuts.
### Aliases: bayes_binom_one_postlike_nstage

### ** Examples

reviews=c(7,18)
prob.success=c(0.9)
prob.failure=c(0.9)
eta=0.9
zeta=0.9
p0=0.1
p1=0.3
prior.a=1e-6
prior.b=1e-6
bayes_binom_one_postlike_nstage(reviews,prob.success,prob.failure,
eta,zeta,p0,p1,prior.a,prior.b)



