library(binhf)


### Name: invansc
### Title: Inverse Anscombe transformation
### Aliases: invansc
### Keywords: manip

### ** Examples


#generate binomial data:

x<-rbinom(100,10,.5)

y<-ansc(x,10)

x1<-invansc(y,10)

#this should be the original data.




