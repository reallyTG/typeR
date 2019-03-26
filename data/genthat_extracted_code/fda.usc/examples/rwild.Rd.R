library(fda.usc)


### Name: rwild
### Title: Wild bootstrap residuals
### Aliases: rwild
### Keywords: distribution

### ** Examples


n<-100
# For golden wild bootstrap variable
e.boot0=rwild(rep(1,len=n),"golden")
# Construction of wild bootstrap residuals
e=rnorm(n)
e.boot1=rwild(e,"golden")
e.boot2=rwild(e,"Rademacher")
e.boot3=rwild(e,"normal")
summary(e.boot1)
summary(e.boot2)
summary(e.boot3)



