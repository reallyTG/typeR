library(emil)


### Name: fit_coxph
### Title: Fit Cox proportional hazards model
### Aliases: fit_coxph

### ** Examples

if(requireNamespace("survival")){

  data("ovarian", package = "survival")
  model <- fit(
      modeling_procedure(
          method = "coxph",
          parameter = list(formula = list(survival::Surv(futime, fustat) ~ age))),
      x = ovarian, y = NULL
  )
  predict(model, ovarian[11:16,])

}



