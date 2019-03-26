library(optimStrat)


### Name: desmse
### Title: Design Mean Squared Error
### Aliases: desmse
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
y<- simulatey(x, b0=0, b1=1, b2=1.25, b4=0.5, rho=0.90)
desmse(y,x,n=500,H=6,d2=1.25,d4=0.50)
desmse(y,x,n=500,H=6,d2=1.00,d4=1.00)



