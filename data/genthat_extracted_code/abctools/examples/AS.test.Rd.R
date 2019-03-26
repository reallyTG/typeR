library(abctools)


### Name: AS.test
### Title: Test for relative approximate sufficiency between two posterior
###   samples.
### Aliases: AS.test
### Keywords: htest

### ** Examples


#create two fake posterior samples:

x1<-runif(10000)
x2<-rnorm(10000)

AS.test(x1=x1,x2=x2,supp=range(x2))




