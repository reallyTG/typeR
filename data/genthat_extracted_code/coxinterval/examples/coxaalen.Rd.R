library(coxinterval)


### Name: coxaalen
### Title: Cox-Aalen model for interval-censored survival data
### Aliases: coxaalen
### Keywords: survival

### ** Examples

# Fit a Cox model to the breast cosmesis dataset
if (is.loaded("coxaalen", "coxinterval")) {
  fit <- coxaalen(Surv(left, right, type = "interval2") ~ prop(treat),
                  data = cosmesis, init.timereg = TRUE,
                  formula.timereg = list(Surv(pmax(left, right, na.rm = TRUE),
                  !is.na(right)) ~ .))
  summary(fit)
}



