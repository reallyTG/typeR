library(epandist)


### Name: depan
### Title: Probability density function (pdf) for an uncensored
###   epanechnikov distribution
### Aliases: depan
### Keywords: distribution

### ** Examples

#Probability distribution function, epanechnikov:
curve(depan(x),col='blue',ylim=c(0,.4),xlim=c(-3.5,3.5),yaxs='i',xaxs='i',
main='Probability distribution function',ylab='Probability')

#Probability distribution function, normal:
curve(dnorm(x),col='green',add=TRUE)

#Legend
legend(x=-3.5,y=.4,legend=c('Epanechnikov pdf','Normal pdf'),lty=c(1,1),col=c('blue','green'))



