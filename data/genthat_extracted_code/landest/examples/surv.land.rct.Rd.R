library(landest)


### Name: surv.land.rct
### Title: Estimates survival using landmark estimation
### Aliases: surv.land.rct
### Keywords: survival nonparametric robust

### ** Examples

data(example_rct)
example_rct.treat = example_rct[example_rct$treat == 1,]
#executable but takes time
#surv.land.rct(tl=example_rct.treat$TL, dl = example_rct.treat$DL, tt=2, landmark = 1, 
#short = cbind(example_rct.treat$TS,example_rct.treat$DS), z.cov = example_rct.treat$Z)




