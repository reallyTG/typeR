library(epandist)


### Name: pepan
### Title: Cumulative distribution function (cdf) for an uncensored
###   epanechnikov distribution
### Aliases: pepan
### Keywords: distribution

### ** Examples

#Probability of a value below -1.96:
pepan(x=-1.96,mu=0,r=5^.5)

#Cumulative distribution function of epanechnikov distribution:
curve(pepan(x),col='blue',xlim=c(-2.5,2.5),yaxs='i',xaxs='i',
main='Cumulative distribution function',ylab='Probability')

#Cumulative distribution function of standard normal distribution:
curve(pnorm(x),col='green',add=TRUE)

#Legend
legend(x=-2.5,y=1,legend=c('Epanechnikov cdf','Normal cdf'),lty=c(1,1),col=c('blue','green'))



