library(blm)


### Name: crude.risk
### Title: Risk-exposure scatter plot
### Aliases: crude.risk

### ** Examples


data(aarp)

risk <- crude.risk(bladder70~redmeat,
		  weights = aarp$w,
		  data = aarp)

risk.exposure.plot(risk,
		   xlab = "Avg. Red Meat Consumption")




