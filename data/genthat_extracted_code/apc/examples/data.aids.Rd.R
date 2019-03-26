library(apc)


### Name: data.aids
### Title: UK aids data
### Aliases: data.aids

### ** Examples

#########################
##	It is convient to construct a data variable
data	<- data.Belgian.lung.cancer()
##	To see the content of the data
data

#########################
#	Forecast AIDS incidences by diagonsis year (cohort).
#	uses as poisson response model with an AC structure
#	although there is evidence of overdispersion and the
#	period effect appears significant.
#	The omission of the period effect follows
#	Davison and Hinkley and a parsimoneous model may be
#	advantageous when forecasting.
#
apc.fit.table(data.aids(),"poisson.response")
fit <- apc.fit.model(data.aids(),"poisson.response","AC")
forecast <- apc.forecast.ac(fit)
data.sums.coh <- apc.data.sums(data.aids())$sums.coh
forecast.total <- forecast$response.forecast.coh
forecast.total[,1]	<- forecast.total[,1]+data.sums.coh[25:38]
x	<- seq(1983.5,1992.75,by=1/4)
y	<- data.sums.coh
xlab<- "diagnosis year (cohort)"
ylab<- "diagnoses"
main<- "Davison and Hinkley, Fig 7.6, parametric version"
plot(x,y,xlim=c(1988,1993),ylim=c(200,600),xlab=xlab,ylab=ylab,main=main)
apc.polygon(forecast.total,x.origin=1989.25,unit=1/4)



