library(profileModel)


### Name: profileModel
### Title: Get the profiles of arbitrary objectives for arbitrary
###   'glm'-like models
### Aliases: profileModel prelim.profiling profiling
### Keywords: models

### ** Examples

## Begin Example 1
library(MASS)
m1 <- glm(Claims ~ District + Group + Age + offset(log(Holders)),
          data = Insurance, family = poisson)
# profile deviance +-5 estimated standard errors from the estimate
prof0 <- profileModel(m1, objective = "ordinaryDeviance")
# profile deviance over a grid of values
gridd <- rep(c(-1,1), length(coef(m1)))
prof1 <- profileModel(m1, grid.bounds = gridd,
                      objective = "ordinaryDeviance")
# profile deviance until the profile reaches qchisq(0.95,1)
prof2 <- profileModel(m1, quantile = qchisq(0.95,1) ,
                      objective = "ordinaryDeviance")
# plot the profiles of the deviance
plot(prof2)
# quite quadratic in shape. Just to make sure:
plot(prof2, signed = TRUE)
# Ok straight lines. So we expect first order asymptotics to work well;
## Not run: 
##D # plot the profiles of the Rao score statistic
##D # profile Rao's score statistic
##D prof3 <- update(prof2, objective = "RaoScoreStatistic",
##D                 X = model.matrix(m1))
##D plot(prof3)
##D # The 95% confidence intervals based on prof2 and prof3 and the simple Wald
##D # confidence intervals:
##D profConfint(prof2)
##D profConfint(prof3)
##D stdErrors <- coef(summary(m1))[,2]
##D coef(m1)+ qnorm(0.975) * cbind(-stdErrors,stdErrors)
##D # They are all quite similar in value. The result of a quadratic likelihood.
##D ## End Example
## End(Not run)
## Begin Example 2: Monotone likelihood; data separation;
library(MASS)
y <- c(0, 0, 1, 0)
tots <- c(2, 2, 5, 2)
x1 <- c(1, 0, 1, 0)
x2 <- c(1, 1, 0, 0)
m2 <- glm(y/tots ~ x1 + x2, weights = tots,
          family = binomial)
prof <- profileModel(m2, quantile=qchisq(0.95,1),
                     objective = "ordinaryDeviance")
plot(prof)
profConfint(prof)
# profile.glm fails to detect the finite endpoints
confint(m2)
## End Example
## Not run: 
##D ## Begin Example 3: polr
##D library(MASS)
##D options(contrasts = c("contr.treatment", "contr.poly"))
##D house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
##D prof.plr0 <- profileModel(house.plr, objective = function(fm) fm$deviance)
##D plot(prof.plr0)
##D # do it with a quantile
##D prof.plr1 <- update(prof.plr0, quantile = qchisq(0.95, 1))
##D plot(prof.plr1)
##D ## End Example
## End(Not run)



