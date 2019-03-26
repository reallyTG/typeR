library(surv2sampleComp)


### Name: rmstreg
### Title: Adjusted difference/ratio of restricted mean survival times
### Aliases: rmstreg

### ** Examples

D=pbc.sample()
x=cbind(D$group, D$covariates)
rmstreg(D$time, D$status, x, D$group, tau=8, type="difference")



