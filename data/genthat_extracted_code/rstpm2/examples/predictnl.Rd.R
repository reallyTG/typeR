library(rstpm2)


### Name: predictnl
### Title: Estimation of standard errors using the numerical delta method.
### Aliases: predictnl predictnl.default predictnl.lm predict.formula
###   print.predictnl confint.predictnl

### ** Examples


df <- data.frame(x=0:1, y=c(10, 20))
fit <- glm(y ~ x, df, family=poisson)

predictnl(fit,
          function(obj,newdata)
          diff(predict(obj,newdata,type="response")))




