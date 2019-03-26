library(eha)


### Name: mort
### Title: Male mortality in ages 40-60, nineteenth century
### Aliases: mort
### Keywords: datasets

### ** Examples

data(mort)
coxreg(Surv(enter, exit, event) ~ ses, data = mort)



