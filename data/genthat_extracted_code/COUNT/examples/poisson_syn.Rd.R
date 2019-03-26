library(COUNT)


### Name: poisson_syn
### Title: Poisson : generic synthetic Poisson data and model
### Aliases: poisson_syn
### Keywords: models Poisson

### ** Examples


# standard Poisson model with two predictors and intercept
sim.data <- poisson_syn(nobs = 500, xv = c(2, .75, -1.25))
mypo <- glm(py ~ . , family=poisson, data = sim.data)
summary(mypo)
confint(mypo)

# Poisson with offset and three predictors
oset <- rep(1:5, each=100, times=1)*100 
loff <- log(oset)   
sim.data <- poisson_syn(nobs = 500, off = loff, xv = c(1.2, -.75, .25, -1.3))
mypof <- glm(py ~ . + loff, family=poisson, data = sim.data)
summary(mypof)
confint(mypof)

# Poisson without offset, exponentiated coefficients, CI's
sim.data <- poisson_syn(nobs = 500, xv = c(2, .75, -1.25))
mypo <- glm(py ~ . , family=poisson, data = sim.data)
exp(coef(mypo))
exp(confint(mypo))

## Not run: 
##D # default (without offset)
##D sim.data <- poisson_syn()
##D dmypo <- glm( py ~ . , family=poisson, data = sim.data)
##D summary(dmypo)
## End(Not run)




