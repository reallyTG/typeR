library(HPbayes)


### Name: postpri.plot
### Title: Posterior/Prior Heligman-Pollard parameter distribution plot
### Aliases: postpri.plot
### Keywords: misc

### ** Examples

##load a prior distribution##
data(HPprior)
##obtain and posterior distribution##
result <- hp.bm.imis(prior=q0, K=10, nrisk=lx, ndeath=dx) 

##plot them##
postpri.plot(prior=q0, hpp=result$H.final)
postpri.plot(prior=q0, hpp=result$H.final, box=TRUE)



