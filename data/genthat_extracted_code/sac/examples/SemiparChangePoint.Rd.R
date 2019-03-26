library(sac)


### Name: SemiparChangePoint
### Title: Semiparametric Test of Change-point(s) with One-change or
###   Epidemic Alternative
### Aliases: SemiparChangePoint
### Keywords: htest models

### ** Examples

require(sac) #load the package
# one-change alternative
k<-10
n<-30
x<-rnorm(n,0,1)
x[(k+1):n]<-x[(k+1):n]+1.5
SemiparChangePoint(x, alternative = "one.change")

# epidemic alternative
k<-5
m<-10
n<-20
x<-rnorm(n,0,1)
x[(k+1):m]<-x[(k+1):m]+1.5
SemiparChangePoint(x,  alternative = "epidemic")



