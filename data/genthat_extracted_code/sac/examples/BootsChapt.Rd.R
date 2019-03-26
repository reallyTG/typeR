library(sac)


### Name: BootsChapt
### Title: Bootstrap (Permutation) Test of Change-Point(s) with One-Change
###   or Epidemic Alternative
### Aliases: BootsChapt
### Keywords: htest

### ** Examples

require(sac) #load the package

# one-change alternative
k<-10
n<-20
x<-rnorm(n,0,1)
x[(k+1):n]<-x[(k+1):n]+1.5
T<-SemiparChangePoint(x, alternative = "one.change")$Sn
BootsChapt(x, T, B = 5)
    #Choose larger B to get better approximate p-value.



