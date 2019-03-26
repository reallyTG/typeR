library(HPbayes)


### Name: hpbayes.plot
### Title: Bayesian Melding posterior Heligman-Pollard parameter
###   distribution plot
### Aliases: hpbayes.plot
### Keywords: misc

### ** Examples

#load a prior, age, nrisk and ndeath#
data(HPprior)

result <- hp.bm.imis(prior=q0, K=10, age=age, nrisk=lx, ndeath=dx)
H.final <- result$H.final

hpbayes.plot(nrisk=lx, ndeath=dx, age=age, hpp=H.final, plotdata=TRUE)
hpbayes.plot(age=age, hpp=H.final)




