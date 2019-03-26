library(optimStrat)


### Name: expmse
### Title: Anticipated Mean Squared Error
### Aliases: expmse
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
expmse(b=c(1,1),d=c(1,1),x,n=500,H=6,Rxy=0.9)
expmse(b=c(1,1),d=c(1,1),x,n=500,H=6,Rxy=0.9,st=1:3)
expmse(b=c(1,1),d=c(1,1),x,n=500,H=6,Rxy=0.9,st=1:3,short=TRUE)

stratum<- optiallo(n=500,x,H=6)
poststratum<- optiallo(n=500,x^1.5,H=10)
expmse(b=c(1,1),d=c(1,1),x,n=500,H=6,Rxy=0.9,
   estrato1=poststratum,estrato2=stratum)




