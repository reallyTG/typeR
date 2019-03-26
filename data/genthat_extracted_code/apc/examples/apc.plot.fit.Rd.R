library(apc)


### Name: apc.plot.fit
### Title: Plots of apc estimates
### Aliases: apc.plot.fit

### ** Examples

#####################
#	Example with Italian bladder cancer data
#	Note that the model.design "AC" cannot be rejected against "APC"
#		so there is little difference between the two plots of those fits.

data.list	<- data.Italian.bladder.cancer()
apc.fit.table(data.list,"poisson.dose.response")
fit.apc		<- apc.fit.model(data.list,"poisson.dose.response","APC")
apc.plot.fit(fit.apc)
dev.new()
fit.ac		<- apc.fit.model(data.list,"poisson.dose.response","AC")
apc.plot.fit(fit.ac)

#	to check the numerical values for the last two rows of plots use
apc.identify(fit.ac)$coefficients.detrend
apc.identify(fit.ac)$coefficients.detrend

#	to get only a sub plot and playing with titles
apc.plot.fit(fit.ac,sub.plot="a",main.outer="My outer title",main.sub="My sub title")
#	to get only a all plots and playing with titles
apc.plot.fit(fit.ac,main.outer="My outer title",main.sub=c("1","2","3","4","5","6","7","8","9"))



