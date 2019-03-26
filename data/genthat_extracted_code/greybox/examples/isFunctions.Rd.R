library(greybox)


### Name: is.greybox
### Title: Greybox classes checkers
### Aliases: is.greybox is.alm is.greyboxC is.greyboxD is.rollingOrigin
###   is.rmc
### Keywords: ts univar

### ** Examples


xreg <- cbind(rlaplace(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rlaplace(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")

ourModel <- alm(y~x1+x2, xreg, distribution="dnorm")

is.alm(ourModel)
is.greybox(ourModel)
is.greyboxC(ourModel)
is.greyboxD(ourModel)




