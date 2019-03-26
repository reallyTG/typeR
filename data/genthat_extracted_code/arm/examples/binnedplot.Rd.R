library(arm)


### Name: binnedplot
### Title: Binned Residual Plot
### Aliases: binnedplot binned.resids
### Keywords: dplot

### ** Examples

old.par <- par(no.readonly = TRUE)
 data(lalonde)
 attach(lalonde)
 fit <- glm(treat ~ re74 + re75 + educ + black + hisp + married 
               + nodegr + u74 + u75, family=binomial(link="logit"))
 x <- predict(fit)
 y <- resid(fit)
 binnedplot(x,y)
par(old.par)



