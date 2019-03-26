library(emdbook)


### Name: credint
### Title: Calculate Bayesian credible intervals
### Aliases: tcredint ncredint
### Keywords: misc

### ** Examples

tcredint("beta",list(shape1=5,shape2=10),verbose=TRUE)
pvec = seq(0,1,length=100)
postvec = dbeta(pvec,shape1=5,shape2=10)
ncredint(pvec,postvec,verbose=TRUE)
set.seed(1001)



