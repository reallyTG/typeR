library(FAdist)


### Name: LLOGIS3
### Title: Three-Parameter Log-Logistic Distribution
### Aliases: dllog3 pllog3 qllog3 rllog3
### Keywords: distribution

### ** Examples

m <- 100
x <- rllog3(10,1,0,m)
dllog3(x,1,0,m)
dllog(x-m,1,0)
dlogis(log(x-m),0,1)/(x-m)



