library(regplot)


### Name: regplot
### Title: Plots a regression nomogram showing covariate distribution.
### Aliases: regplot

### ** Examples

library(survival)
 data(pbc) 
 pbc$catbili <- cut(pbc$bili,breaks=c(-Inf, 2, 4, Inf),
                labels=c("low","medium","high"))
 pbc$died <- pbc$status==2
 pbccox <-  coxph(formula = Surv(time,died) ~  age + catbili + sex + 
                  copper +stage + trt,data=pbc)
 ## Plot a Cox survival model, showing data for the first observation.
 ## Display risk for 730, and 1825 days
  regplot(pbccox,observation=pbc[1,],  failtime = c(730,1825), prfail = TRUE ) 
 ## Plot a Weibull model 
  pbcweib <-  survreg(formula = Surv(time,died) ~  age + catbili + sex + 
                  copper +stage + trt,dist="weibull", data=pbc)
 regplot(pbcweib,observation=pbc[1,], failtime = 1825, prfail = TRUE ) 
 ## Plot a logistic regression, showing odds scale and confidence interval
 pbcglm <- glm(died ~  age + catbili + sex + copper,family = "binomial", data=pbc )
 regplot(pbcglm, observation=pbc[1,], odds=TRUE,interval="confidence")



