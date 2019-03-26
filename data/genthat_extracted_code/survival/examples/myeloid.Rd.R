library(survival)


### Name: myeloid
### Title: Acute myeloid leukemia
### Aliases: myeloid
### Keywords: datasets

### ** Examples

coxph(Surv(futime, death) ~ trt, data=myeloid)
# See the mstate vignette for a more complete analysis



