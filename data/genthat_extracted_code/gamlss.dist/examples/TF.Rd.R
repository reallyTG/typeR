library(gamlss.dist)


### Name: TF
### Title: t family distribution for fitting a GAMLSS
### Aliases: TF dTF pTF qTF rTF TF2 dTF2 pTF2 qTF2 rTF2
### Keywords: distribution regression

### ** Examples

TF()# gives information about the default links for the t-family distribution 
# library(gamlss)
#data(abdom)
#h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=TF, data=abdom) # fits 
#plot(h)
newdata<-rTF(1000,mu=0,sigma=1,nu=5) # generates 1000 random observations
hist(newdata) 



