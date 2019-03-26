library(tscount)


### Name: tsglm
### Title: Count Time Series Following Generalised Linear Models
### Aliases: tsglm print.tsglm logLik.tsglm tsglm.meanfit vcov.tsglm

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
interventions <- interv_covariate(n=length(campy), tau=c(84, 100),
  delta=c(1, 0)) #detected by Fokianos and Fried (2010, 2012)
#Linear link function with Negative Binomial distribution:
campyfit <- tsglm(campy, model=list(past_obs=1, past_mean=13),
  xreg=interventions, distr="nbinom")
campyfit
plot(campyfit)

###Road casualties in Great Britain (see help("Seatbelts"))
timeseries <- Seatbelts[, "VanKilled"]
regressors <- cbind(PetrolPrice=Seatbelts[, c("PetrolPrice")],
                    linearTrend=seq(along=timeseries)/12)
#Logarithmic link function with Poisson distribution:                    
seatbeltsfit <- tsglm(ts=timeseries, link="log",
  model=list(past_obs=c(1, 12)), xreg=regressors, distr="poisson")
summary(seatbeltsfit)



