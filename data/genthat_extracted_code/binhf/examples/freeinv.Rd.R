library(binhf)


### Name: freeinv
### Title: Inverse Freeman-Tukey transform
### Aliases: freeinv
### Keywords: manip

### ** Examples


#generate binomial data:

x<-rbinom(100,10,.5)

y<-free(x,10)

x1<-freeinv(y,10)

#this should be the original data.




