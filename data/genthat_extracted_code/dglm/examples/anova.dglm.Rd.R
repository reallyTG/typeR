library(dglm)


### Name: anova.dglm
### Title: Analysis of Deviance for Double Generalized Linear Model Fits
### Aliases: anova.dglm
### Keywords: models regression

### ** Examples

# Continuing the example from  glm, but this time try
# fitting a Gamma double generalized linear model also.
library(statmod)
clotting <- data.frame(
      u = c(5,10,15,20,30,40,60,80,100),
      lot1 = c(118,58,42,35,27,25,21,19,18),
      lot2 = c(69,35,26,21,18,16,13,12,12))
         
# The same example as in  glm: the dispersion is modelled as constant
out <- dglm(lot1 ~ log(u), ~1, data=clotting, family=Gamma)
summary(out)

# Try a double glm 
out2 <- dglm(lot1 ~ log(u), ~u, data=clotting, family=Gamma)

summary(out2)
anova(out2)



