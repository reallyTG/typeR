library(signmedian.test)


### Name: signmedian.test
### Title: Perform Exact Sign Test and Asymptotic Sign Test in Large
###   Samples
### Aliases: signmedian.test
### Keywords: signtest non-parametric

### ** Examples

##One-sample test
x<-c(-5,-3,-2,1,5,6,3,9,10,15,20,21)
signmedian.test(x,alternative = "greater",exact=TRUE)
signmedian.test(x,mu=3,alternative="two.sided",exact=FALSE)
##Two-sample test(paired data)
x<-c(-5,-3,-2,1,5,6,3,9,10,15,20,21)
y<-c(-1,-2,-3,1,2,3,4,2,6,8,9,10)
x<-y-x
signmedian.test(x,alternative = "greater",exact=TRUE)



