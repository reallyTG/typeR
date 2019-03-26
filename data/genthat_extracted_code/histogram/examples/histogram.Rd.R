library(histogram)


### Name: histogram
### Title: histogram with automatic choice of bins
### Aliases: histogram
### Keywords: nonparametric smooth

### ** Examples


## draw a histogram from a standard normal sample

y<-rnorm(100)
histogram(y)

## draw a histogram from a standard exponential sample

y<-rexp(1500)
histogram(y)

## draw a histogram from a normal mixture 

n<-sum(sample(c(0,1),1000,replace=TRUE))
y<-c(rnorm(n,mean=5,sd=0.1),rnorm(1000-n))
histogram(y)

## the same using a regular histogram with Kullback-Leibler CV 

n<-sum(sample(c(0,1),1000,replace=TRUE))
y<-c(rnorm(n,mean=5,sd=0.1),rnorm(1000-n))
histogram(y,type="regular",penalty="cv",control=list(cvformula=3))




