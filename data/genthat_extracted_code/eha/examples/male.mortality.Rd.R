library(eha)


### Name: male.mortality
### Title: Male mortality in ages 40-60, nineteenth century
### Aliases: male.mortality
### Keywords: datasets

### ** Examples

data(male.mortality)
coxreg(Surv(enter, exit, event) ~ ses, data = male.mortality)



