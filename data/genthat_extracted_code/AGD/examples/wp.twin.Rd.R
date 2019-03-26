library(AGD)


### Name: wp.twin
### Title: Superposes two worm plots
### Aliases: wp.twin
### Keywords: smooth

### ** Examples


library(gamlss)
data(abdom)
a <- gamlss(y~cs(x,df=1),sigma.fo=~cs(x,0),family=LO,data=abdom)
b <- gamlss(y~cs(x,df=3),sigma.fo=~cs(x,1),family=LO,data=abdom)
coeff1 <- wp.twin(a,b,line=TRUE)
coeff1
rm(a,b,coeff1)



