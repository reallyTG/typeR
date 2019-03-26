library(gamlss.nl)


### Name: gamlss-nl-package
### Title: The GAMLSS add on package for fiting parametric non linear
###   models
### Aliases: gamlss-nl-package gamlss-nl
### Keywords: package

### ** Examples

data(la)
# fitting the Johnson's Su distribtion to the data
modJSU   <- nlgamlss(y=PET60, mu.fo= ~bflow*(1-p1*exp(-p2/bflow)), sigma.formula=~1, 
                       nu.fo=~1, mu.start = c(.6, 110), sigma.start= 3, nu.start=1, 
                       tau.start=0.6, family=JSU, data=la) 
plot(modJSU)
summary(modJSU)
vcov(modJSU)



