library(pairwiseCI)


### Name: rooting
### Title: Rooting (success/failure) of plants in a 3-factorial field trial
### Aliases: rooting
### Keywords: datasets

### ** Examples

data(rooting)

rooting$IBAf<-as.factor(rooting$IBA)
rooting$Rep<-as.factor(rooting$Rep)

fitB<-glm(cbind(root,noroot)~Rep+(Age + Position + IBA)^2,
 data=rooting, family=binomial)

fitQB<-glm(cbind(root,noroot)~Rep+(Age + Position + IBA)^2,
 data=rooting, family=quasibinomial)

summary(fitB)
summary(fitQB)

anova(fitB, test="Chisq")
anova(fitQB, test="F")




