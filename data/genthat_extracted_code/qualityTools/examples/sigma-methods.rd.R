library(qualityTools)


### Name: sigma-methods
### Title: Get and set methods
### Aliases: sigma sigma<- sigma-methods sigma,gageRR-method
###   sigma<-,gageRR-method

### ** Examples

x = gageRRDesign(Operators = 3, Parts = 10, Measurements = 3)
#default 6sigma
sigma(x) 
sigma(x) = 5.15
sigma(x)



