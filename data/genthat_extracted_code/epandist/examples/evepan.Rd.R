library(epandist)


### Name: evepan
### Title: Calculate expected value of censored variable
### Aliases: evepan
### Keywords: distribution

### ** Examples

#Expected value of an epan-distributed variable left-censored at 100 (given mu=100 and r=10):
evepan(c=100,mu=100,r=10)

#Expected value as a function of censoring point, epanechnikov distribution:
curve(evepan(c=x),col='blue',xlim=c(-sqrt(5),sqrt(5)),yaxs='i',xaxs='i',
main='Expected value as a function of censoring point',xlab='Censoring point',ylab='Expected value')

#Expected value as a function of censoring point, normal distribution:
curve(dnorm(x)+pnorm(x)*x,col='green',add=TRUE)

#Expected value as a function of censoring point, no uncertainty:
curve(1*x,col='grey',add=TRUE)

#Legend
legend(x=-sqrt(5),y=sqrt(5),legend=c('Epanechnikov','Normal distribution','No uncertainty'),
lty=c(1,1),col=c('blue','green','grey'))



