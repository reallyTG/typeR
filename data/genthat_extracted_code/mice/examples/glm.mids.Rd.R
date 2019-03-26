library(mice)


### Name: glm.mids
### Title: Generalized linear model for 'mids' object
### Aliases: glm.mids
### Keywords: multivariate

### ** Examples


imp <- mice(nhanes)

# logistic regression on the imputed data
fit <- glm.mids((hyp==2)~bmi+chl, data=imp, family = binomial)
fit




