library(hbim)


### Name: hbrr
### Title: Calculate expected relative risk or percent protected from Hill
###   model with Bliss Independence
### Aliases: hbrr hbpp
### Keywords: models

### ** Examples
 
## example of two dimensional integral
hbrr(c(.123,.432),matrix(c(1,.5,.5,1),2,2))
## faster but less accurate estimation by simulatin
hbrr(c(.123,.432),matrix(c(1,.5,.5,1),2,2),simulate=TRUE,nsim=10^4)




