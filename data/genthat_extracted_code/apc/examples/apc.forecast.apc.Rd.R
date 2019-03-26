library(apc)


### Name: apc.forecast.apc
### Title: Forecast models with APC structure.
### Aliases: apc.forecast.apc

### ** Examples

#####################
#  EXAMPLE with reserving data: data.loss.TA()

data	<- data.loss.TA()
fit.apc	<- apc.fit.model(data,"poisson.response","APC")
forecast	<- apc.forecast.apc(fit.apc)

#	forecasts by "policy-year"
forecast$response.forecast.coh
#	         forecast
#	coh_2    91718.82
#	coh_3   464661.38
#	coh_4   704591.94
#	coh_5  1025337.23
#	coh_6  1503253.81
#	coh_7  2330768.44
#	coh_8  4115906.56
#	coh_9  4257958.30
#	coh_10 4567231.84
#	forecasts of "cash-flow"
forecast$response.forecast.per
#	        forecast
#	per_11 5274762.58
#	per_12 4213526.23
#	per_13 3188451.80
#	per_14 2210649.45
#	per_15 1644203.06
#	per_16 1236495.32
#	per_17  764552.75
#	per_18  444205.71
#	per_19   84581.44
#	forecast  of "total reserve"
forecast$response.forecast.all
#	    forecast
#	all 19061428



