library(blm)


### Name: risk.exposure.plot
### Title: Risk-exposure scatter plot
### Aliases: risk.exposure.plot

### ** Examples


data(aarp)

risk <- crude.risk(bladder70~redmeat,
		  weights = aarp$w,
		  data = aarp)

risk.exposure.plot(risk,
		   xlab = "Avg. Red Meat Consumption")




