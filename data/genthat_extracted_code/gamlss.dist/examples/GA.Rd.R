library(gamlss.dist)


### Name: GA
### Title: Gamma distribution for fitting a GAMLSS
### Aliases: GA dGA qGA pGA rGA
### Keywords: distribution regression

### ** Examples

GA()# gives information about the default links for the gamma distribution      
# dat<-rgamma(100, shape=1, scale=10) # generates 100 random observations 
# fit a gamlss model
# gamlss(dat~1,family=GA) 
# fits a constant for each parameter mu and sigma of the gamma distribution
newdata<-rGA(1000,mu=1,sigma=1) # generates 1000 random observations
hist(newdata) 
rm(dat,newdata)



