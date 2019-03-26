library(bayesdistreg)


### Name: dr_asympar
### Title: Binary glm object at several threshold values
### Aliases: dr_asympar

### ** Examples

y = faithful$waiting
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
qtaus = quantile(y,c(0.05,0.25,0.5,0.75,0.95))
drabj<- dr_asympar(y=y,x=x,thresh = qtaus)
lapply(drabj,coef); lapply(drabj,vcov) 
# mean and covariance at respective threshold values




