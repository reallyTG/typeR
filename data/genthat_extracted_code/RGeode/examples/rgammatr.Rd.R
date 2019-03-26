library(RGeode)


### Name: rgammatr
### Title: Random generator for a Truncated Gamma distribution.
### Aliases: rgammatr

### ** Examples

#Simulate a truncated Gamma with parameters 1,2 in the range
#1,5.
#Set the range:
range<- c(1,5)

#Simulate the truncated Gamma
set.seed(123)
vars1<-rgammatr(1000,1,2,range)

#Look at the histogram
hist(vars1,freq=FALSE,ylim=c(0,2),xlim = c(0,5))
lines(density(vars1))

#Compare with a non truncated Gamma
set.seed(123)
vars2<-rgamma(1000,1,2)


#Compare the two results
lines(density(vars2),col='red')

#Observation: simulate without range is equivalent to simulate from
#rgamma(1000,1,2)




