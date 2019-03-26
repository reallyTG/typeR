library(COUNT)


### Name: logit_syn
### Title: Logistic regression : generic synthetic binary/binomial logistic
###   data and model
### Aliases: logit_syn
### Keywords: models logit binomial

### ** Examples

# Binary logistic regression (denominator=1)
sim.data <-logit_syn(nobs = 500, d = 1, xv = c(1, .5, -1.5))
mylogit <- glm(cbind(by,dby) ~ ., family=binomial(link="logit"), data = sim.data)
summary(mylogit)
confint(mylogit)

# Binary logistic regression with odds ratios (denominator=1); 3 predictors
sim.data <-logit_syn(nobs = 500, d = 1, xv = c(1, .75, -1.5, 1.15))
mylogit <- glm(cbind(by,dby) ~ ., family=binomial(link="logit"), data = sim.data)
exp(coef(mylogit))
exp(confint(mylogit))

# Binomial or grouped logistic regression with defined denominator, den
den <- rep(1:5, each=100, times=1)*100
sim.data <- logit_syn(nobs = 500, d = den, xv = c(1, .5, -1.5))
gby <- glm(cbind(by,dby) ~ ., family=binomial(link="logit"), data = sim.data)
summary(gby)

## Not run: 
##D # default
##D sim.data <- logit_syn(nobs=500, d=1,  xv = c(2, -.55, 1.15))
##D dlogit <- glm(cbind(by,dby) ~ . , family=binomial(link="logit"), data = sim.data)
##D summary(dlogit)
## End(Not run)




