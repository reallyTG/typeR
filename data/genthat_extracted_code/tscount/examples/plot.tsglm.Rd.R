library(tscount)


### Name: plot.tsglm
### Title: Diagnostic Plots for a Fitted GLM-type Model for Time Series of
###   Counts
### Aliases: plot.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
interventions <- interv_covariate(n=length(campy), tau=c(84, 100),
  delta=c(1, 0)) #detected by Fokianos and Fried (2010, 2012)
#Linear link function with Negative Binomial distribution:
campyfit <- tsglm(campy, model=list(past_obs=1, past_mean=13),
  xreg=interventions, dist="nbinom")
plot(campyfit)



