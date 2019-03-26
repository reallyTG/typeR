library(DiPs)


### Name: addMagnitudePenalty
### Title: Add a directional magnitude penalty to a distance matrix
### Aliases: addMagnitudePenalty

### ** Examples

## Not run: 
##D library(MASS)
##D #
##D data("nh0506Homocysteine")
##D attach(nh0506Homocysteine)
##D # Select covariates
##D X<-cbind(female,age,black,education,povertyr,bmi)
##D #Propensity score
##D p<-glm(z~female+age+black+education+povertyr+bmi,
##D     family=binomial)$fitted.values
##D d<-cbind(nh0506Homocysteine,p)
##D detach(nh0506Homocysteine)
##D dist<-maha_dense(d$z,X)
##D head(dist$d)
##D # Impose a penalty when a treated individual has a higher propensity
##D # score than a control
##D dist<-addMagnitudePenalty(dist, d$z, d$p, positive=TRUE, multiplier = 20)
##D head(dist$d)
## End(Not run)



