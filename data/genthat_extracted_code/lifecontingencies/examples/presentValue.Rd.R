library(lifecontingencies)


### Name: presentValue
### Title: Present value of a series of cash flows.
### Aliases: presentValue

### ** Examples

 #simple example
 cf=c(10,10,10)	#$10 of payments one per year for three years
 t=c(1,2,3) #years
 p=c(1,1,1) #assume payments certainty
 #assume 3% of interest rate
presentValue(cashFlows=cf, timeIds=t, interestRates=0.03, probabilities=p)



