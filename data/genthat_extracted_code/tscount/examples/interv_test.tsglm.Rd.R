library(tscount)


### Name: interv_test.tsglm
### Title: Testing for Interventions in Count Time Series Following
###   Generalised Linear Models
### Aliases: interv_test.tsglm interv_test
### Keywords: Intervention detection

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
#Test for the intervention effects which were found in Fokianos und Fried (2010):
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
campyfit_intervtest <- interv_test(fit=campyfit, tau=c(84,100), delta=c(1,0))
campyfit_intervtest



