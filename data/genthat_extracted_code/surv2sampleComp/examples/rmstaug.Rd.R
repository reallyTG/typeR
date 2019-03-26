library(surv2sampleComp)


### Name: rmstaug
### Title: Adjusted difference/ratio of restricted mean survival times
### Aliases: rmstaug

### ** Examples

D=pbc.sample()
rmstaug(D$time, D$status, D$covariates, D$group, tau=8, type="difference")



