library(survival)


### Name: diabetic
### Title: Ddiabetic retinopathy
### Aliases: diabetic
### Keywords: datasets survival

### ** Examples

# juvenile diabetes is defined as and age less than 20
juvenile <- 1*(diabetic$age < 20)
coxph(Surv(time, status) ~ trt + juvenile + cluster(id),
            data= diabetic)



