library(surv2sampleComp)


### Name: surv2sample
### Title: Inference of model-free between-group contrasts with censored
###   survival data
### Aliases: surv2sample

### ** Examples

D=pbc.sample()
surv2sample(D$time, D$status, D$group, npert=500, timepoints=c(2,4,6,8),
quanprobs =c(0.2, 0.3), tau=8, procedure="KM")



