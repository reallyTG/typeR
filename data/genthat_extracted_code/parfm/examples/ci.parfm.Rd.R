library(parfm)


### Name: ci.parfm
### Title: Confidence Intervals for Hazard Ratios of Covariates of
###   Parametric Frailty Models
### Aliases: ci.parfm

### ** Examples

  data("kidney")
  kidney$sex <- kidney$sex - 1

  pfm <- parfm(Surv(time,status) ~ sex + age, cluster="id", 
               data=kidney, dist="exponential", frailty="gamma")

  ci.parfm(pfm)



