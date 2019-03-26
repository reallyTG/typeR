library(RGeode)


### Name: rexptr
### Title: Random generator for a Truncated Exponential distribution.
### Aliases: rexptr

### ** Examples

#Simulate a truncated Exponential with parameters 0.5 in the range
#5,Inf.
#Set the range:
range<- c(1,Inf)

#Simulate the truncated Gamma
set.seed(123)
vars1<-rexptr(1000,0.5,range)

#Look at the histogram
hist(vars1,freq=FALSE,ylim=c(0,2),xlim = c(0,5))
lines(density(vars1))

#Compare with a non truncated Exponential
set.seed(123)
vars2<-rexp(1000,0.5)


#Compare the two results
lines(density(vars2),col='red')

#Observation: simulate without range is equivalent to simulate from
#rexp(1000,0.5)




