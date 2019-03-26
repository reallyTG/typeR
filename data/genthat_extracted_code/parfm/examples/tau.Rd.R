library(parfm)


### Name: tau
### Title: Kendall's Tau for Parametric Frailty Models
### Aliases: tau
### Keywords: Kendall tau survival frailty parametric marginal likelihood
###   shared

### ** Examples

data(kidney) 
# type 'help(kidney)' for a description of the data set
kidney$sex <- kidney$sex - 1

mod <- parfm(Surv(time,status) ~ sex + age, cluster = "id",
             data = kidney, dist = "exponential", frailty = "gamma")
tau(mod)



