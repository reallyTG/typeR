library(survival)


### Name: retinopathy
### Title: Diabetic Retinopathy
### Aliases: retinopathy
### Keywords: datasets

### ** Examples

coxph(Surv(futime, status) ~ type + trt + cluster(id), retinopathy)



