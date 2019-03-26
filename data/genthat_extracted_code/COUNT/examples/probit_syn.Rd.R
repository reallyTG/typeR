library(COUNT)


### Name: probit_syn
### Title: Probit regression : generic synthetic binary/binomial probit
###   data and model
### Aliases: probit_syn
### Keywords: models probit binomial

### ** Examples


# Binary probit regression (denominator=1)
sim.data <-probit_syn(nobs = 5000, d = 1, xv = c(1, .5, -1.5))
myprobit <- glm(cbind(py,dpy) ~ ., family=binomial(link="probit"), data = sim.data)
summary(myprobit)
confint(myprobit)

# Binary probit regression with 3 predictors (denominator=1)
sim.data <-probit_syn(nobs = 5000, d = 1, xv = c(1, .75, -1.5, 1.15))
myprobit <- glm(cbind(py,dpy) ~ ., family=binomial(link="probit"), data = sim.data)
summary(myprobit)
confint(myprobit)

# Binomial or grouped probit regression with defined denominator, den
den <- rep(1:5, each=1000, times=1)*100
sim.data <- probit_syn(nobs = 5000, d = den, xv = c(1, .5, -1.5))
gpy <- glm(cbind(py,dpy) ~ ., family=binomial(link="probit"), data = sim.data)
summary(gpy)

## Not run: 
##D # default
##D sim.data <- probit_syn()
##D dprobit <- glm(cbind(py,dpy) ~ . , family=binomial(link="probit"), data = sim.data)
##D summary(dprobit)
## End(Not run)




