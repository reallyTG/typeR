library(gamlss.dist)


### Name: RG
### Title: The Reverse Gumbel distribution for fitting a GAMLSS
### Aliases: RG dRG pRG qRG rRG
### Keywords: distribution regression

### ** Examples


plot(function(x) dRG(x, mu=0,sigma=1), -3, 6, 
 main = "{Reverse Gumbel  density mu=0,sigma=1}")
RG()# gives information about the default links for the Gumbel distribution      
dat<-rRG(100, mu=10, sigma=2) # generates 100 random observations 
# library(gamlss)
# gamlss(dat~1,family=RG) # fits a constant for each parameter mu and sigma 




