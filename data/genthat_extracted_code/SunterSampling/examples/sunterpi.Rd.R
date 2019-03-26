library(SunterSampling)


### Name: sunterpi
### Title: Inclusion probabilities for Sunter sampling
### Aliases: sunterpi
### Keywords: survey

### ** Examples

# Ex.1 from Sarndal et al. (1992)
x<-c(40,25,20,10,5)
n<-2
sunterpi(x,n)
# note that the inclusion probabilities are not exactly proportional
# to the measures of size
n*x/sum(x)

# Ex.2
# set the population size
N<-100
set.seed(1)
# build a vector of measures of size
x<-rnorm(N,100,25)
sort(x)
# set the sample size
n<-10
# inclusion probabilities for Sunter's sampling
pi<-sunterpi(x,n)
pi
# theoretical inclusion probabilities
pik<-n*x/sum(x)
pik
# note the difference between actual and theoretical inclusion probabilities
sort(pi)
sort(pik)



