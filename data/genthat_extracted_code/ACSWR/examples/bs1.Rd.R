library(ACSWR)


### Name: bs1
### Title: British Doctors Smoking and Coronary Heart Disease
### Aliases: bs1
### Keywords: Poisson regression

### ** Examples

library(MASS)
data(bs1)
BS_Pois <-  glm(Deaths~Age_Cat+Age_Square+Smoke_Ind+Smoke_Age,offset=
log(Person_Years),data=bs1,family='poisson')
logLik(BS_Pois)
summary(BS_Pois)
with(BS_Pois, pchisq(null.deviance - deviance,df.null - 
df.residual,lower.tail = FALSE)) 
confint(BS_Pois)


