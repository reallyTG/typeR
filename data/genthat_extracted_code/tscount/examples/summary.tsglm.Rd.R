library(tscount)


### Name: summary.tsglm
### Title: Summarising Fits of Count Time Series following Generalised
###   Linear Models
### Aliases: summary.tsglm print.summary.tsglm
### Keywords: Model assessment Inference

### ** Examples

###Road casualties in Great Britain (see help("Seatbelts"))
timeseries <- Seatbelts[, "VanKilled"]
regressors <- cbind(PetrolPrice=Seatbelts[, c("PetrolPrice")],
                    linearTrend=seq(along=timeseries)/12)
#Logarithmic link function with Poisson distribution:                    
seatbeltsfit <- tsglm(ts=timeseries, link="log",
  model=list(past_obs=c(1, 12)), xreg=regressors, distr="poisson")
summary(seatbeltsfit)



