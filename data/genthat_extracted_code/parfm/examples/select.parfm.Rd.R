library(parfm)


### Name: select.parfm
### Title: AIC and BIC values of several Parametric Frailty Models
### Aliases: select.parfm plot.select.parfm print.select.parfm

### ** Examples

## No test: 
data(kidney)
kidney$sex <- kidney$sex - 1

models <- select.parfm(Surv(time,status) ~ sex + age, 
                       dist = c("exponential", 
                                "weibull",
                                "inweibull",
                                "loglogistic", 
                                "lognormal", 
                                "logskewnormal"),
                       frailty = c("gamma", 
                                   "ingau", 
                                   "possta", 
                                   "lognormal"),
                       cluster = "id", data = kidney)
models
plot(models)
## End(No test)



