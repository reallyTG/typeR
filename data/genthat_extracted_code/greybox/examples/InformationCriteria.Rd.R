library(greybox)


### Name: AICc
### Title: Corrected Akaike's Information Criterion and Bayesian
###   Information Criterion
### Aliases: AICc BICc
### Keywords: htest

### ** Examples


xreg <- cbind(rnorm(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rnorm(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")

ourModel <- stepwise(xreg)

AICc(ourModel,h=10)
BICc(ourModel,h=10)




