library(gamlss.dist)


### Name: GU
### Title: The Gumbel distribution for fitting a GAMLSS
### Aliases: GU dGU pGU qGU rGU
### Keywords: distribution regression

### ** Examples


plot(function(x) dGU(x, mu=0,sigma=1), -6, 3, 
 main = "{Gumbel  density mu=0,sigma=1}")
GU()# gives information about the default links for the Gumbel distribution      
dat<-rGU(100, mu=10, sigma=2) # generates 100 random observations 
hist(dat)
# library(gamlss)
# gamlss(dat~1,family=GU) # fits a constant for each parameter mu and sigma 




