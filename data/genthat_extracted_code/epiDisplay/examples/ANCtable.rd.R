library(epiDisplay)


### Name: ANC Table
### Title: Dataset on effect of new ANC method on mortality (as a table)
### Aliases: ANCtable
### Keywords: datasets

### ** Examples

data(ANCtable)
glm1 <- glm(death==2 ~ factor(anc) + factor(clinic),weights=Freq, family=binomial, data=ANCtable)
logistic.display(glm1)
glm2 <- glm(death==2 ~ factor(anc) + factor(clinic),weights=Freq, family=binomial, data=ANCtable)
summary(glm2)$coefficients



