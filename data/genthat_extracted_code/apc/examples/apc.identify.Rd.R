library(apc)


### Name: apc.identify
### Title: Identification of time effects
### Aliases: apc.identify

### ** Examples

########################
#	Belgian lung cancer
# 	first an example with APC design, note that demean and dif not defined.

data.list	<- data.Belgian.lung.cancer()

fit.apc	<- apc.fit.model(data.list,"poisson.dose.response","APC")
fit.apc$coefficients.canonical
id.apc	<- apc.identify(fit.apc)
id.apc$coefficients.ssdd
id.apc$coefficients.detrend
id.apc$coefficients.demean
id.apc$coefficients.dif

fit.ap	<- apc.fit.model(data.list,"poisson.dose.response","AP")
fit.ap$coefficients.canonical
id.ap	<- apc.identify(fit.ap)
id.ap$coefficients.ssdd
id.ap$coefficients.detrend
id.ap$coefficients.demean
id.ap$coefficients.dif




