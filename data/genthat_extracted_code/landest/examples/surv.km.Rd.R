library(landest)


### Name: surv.km
### Title: Estimates survival using Kaplan-Meier estimation
### Aliases: surv.km
### Keywords: survival nonparametric

### ** Examples

data(example_rct)
example_rct.treat = example_rct[example_rct$treat == 1,]
surv.km(tl=example_rct.treat$TL, dl = example_rct.treat$DL, tt=2)



