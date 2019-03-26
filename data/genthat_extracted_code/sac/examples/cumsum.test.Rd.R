library(sac)


### Name: cumsum.test
### Title: Nonparametric Test for Change-Point with One-change or Epidemic
###   Alternative
### Aliases: cumsum.test
### Keywords: nonparametric

### ** Examples

require(sac) #load the package
# one-change alternative
k<-10
n<-30
x<-rnorm(n,0,1)
x[(k+1):n]<-x[(k+1):n]+1.5
cumsum.test(x, alternative = "one.change")
# epidemic alternative
k<-10
m<-20
n<-30
x<-rnorm(n,0,1)
x[(k+1):m]<-x[(k+1):m]+1.5
cumsum.test(x,  alternative = "epidemic")




