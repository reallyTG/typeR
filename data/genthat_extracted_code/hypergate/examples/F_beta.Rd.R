library(hypergate)


### Name: F_beta
### Title: F_beta
### Aliases: F_beta

### ** Examples

data(Samusik_01_subset)
truth=c(rep(TRUE,40),rep(FALSE,60))
pred=rep(c(TRUE,FALSE),50)
table(pred,truth) ##40% purity, 50% yield
#' F_beta(pred=pred,truth=truth,beta=2) ##Closer to yield
F_beta(pred=pred,truth=truth,beta=1.5) ##Closer to yield
F_beta(pred=pred,truth=truth,beta=1) ##Harmonic mean
F_beta(pred=pred,truth=truth,beta=0.75) ##Closer to purity
F_beta(pred=pred,truth=truth,beta=0.5) ##Closer to purity



