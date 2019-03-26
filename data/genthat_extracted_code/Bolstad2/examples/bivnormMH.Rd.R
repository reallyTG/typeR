library(Bolstad2)


### Name: bivnormMH
### Title: Metropolis Hastings sampling from a Bivariate Normal
###   distribution
### Aliases: bivnormMH

### ** Examples

## independent chain
chain1.df<-bivnormMH(0.9)$targetSample

## random walk chain
chain2.df<-bivnormMH(0.9, type = 'r')$targetSample


## blockwise MH chain
chain3.df<-bivnormMH(0.9, type = 'b')$targetSample

## Gibbs sampling chain
chain4.df<-bivnormMH(0.9, type = 'g')$targetSample

oldPar <- par(mfrow=c(2,2))
plot(y ~ x, type = 'l', chain1.df, main = 'Independent')
plot(y ~ x, type = 'l', chain2.df, main = 'Random Walk')
plot(y ~ x, type = 'l', chain3.df, main = 'Blockwise')
plot(y ~ x, type = 'l', chain4.df, main = 'Gibbs')
par(oldPar)



