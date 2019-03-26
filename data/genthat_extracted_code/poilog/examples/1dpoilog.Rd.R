library(poilog)


### Name: Poisson lognormal
### Title: Poisson lognormal distribution
### Aliases: dpoilog rpoilog
### Keywords: distribution

### ** Examples


### plot density for given parameters 
barplot(dpoilog(n=0:20,mu=2,sig=1),names.arg=0:20)

### draw random deviates from a community of 50 species 
rpoilog(S=50,mu=2,sig=1)

### draw random deviates including zeros 
rpoilog(S=50,mu=2,sig=1,keep0=TRUE)

### draw random deviates with sampling intensity = 0.5 
rpoilog(S=50,mu=2,sig=1,nu=0.5)

### how many species are likely to be observed 
### (given S,mu,sig2 and nu)? 
hist(replicate(1000,length(rpoilog(S=30,mu=0,sig=3,nu=0.7))))

### how many individuals are likely to be observed
### (given S,mu,sig2 and nu)? 
hist(replicate(1000,sum(rpoilog(S=30,mu=0,sig=3,nu=0.7))))





