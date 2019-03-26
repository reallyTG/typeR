library(glm2)


### Name: glm.fit2
### Title: Generalized Linear Models Fitting Method
### Aliases: glm.fit2

### ** Examples

library(glm2)

#--- logistic regression null model ---------------#
# (intercept estimate = log(0.75/0.25) = 1.098612)

y <- c(1,1,1,0)
x <- rep(1,4)

#--- divergence of glm.fit to infinite estimate ---#
fit1 <- glm.fit(x,y, family=binomial(link="logit"),start=-1.81)
fit2 <- glm.fit2(x,y, family=binomial(link="logit"),start=-1.81)
print.noquote(c(fit1$coef,fit2$coef))




