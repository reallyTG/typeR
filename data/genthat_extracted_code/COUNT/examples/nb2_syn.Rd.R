library(COUNT)


### Name: nb2_syn
### Title: Negative binomial (NB2): generic synthetic negative binomial
###   data and model
### Aliases: nb2_syn
### Keywords: models negative binomial

### ** Examples

library(MASS)           

sim.data <- nb2_syn(nobs = 500, alpha = .5, xv = c(2, .75, -1.25))
mynb2 <- glm.nb(nby ~ . , data = sim.data)
summary(mynb2)
confint(mynb2)

# with offset
oset <- rep(1:5, each=100, times=1)*100 
loff <- log(oset)   
sim.data <- nb2_syn(nobs = 500, off = loff, alpha = .5, xv = c(1.2, -.75, .25, -1.3))
mypof <- glm.nb(nby ~ . + loff, data = sim.data)
summary(mypof)
confint(mypof)

# without offset, exponentiated coefficients, CI's
sim.data <- nb2_syn(nobs = 500, alpha = .75, xv = c(1, .5, -1.4))
mynbf <- glm.nb(nby ~ . , data = sim.data)
exp(coef(mynbf))
exp(confint(mynbf))

## Not run: 
##D # default, without offset
##D sim.data <- nb2_syn()
##D dnb2 <- glm.nb(nby ~ . , data = sim.data)
##D summary(dnb2)
## End(Not run)

# use ml.nb2.r function
sim.data <- nb2_syn(nobs = 500, alpha = .5, xv = c(2, .75, -1.25))
mynb2x <- ml.nb2(nby ~ . , data = sim.data)
mynb2x

## Not run: 
##D # use gamlss function for modeling data after sim.data created
##D library(gamlss)
##D sim.data <- nb2_syn(nobs = 500, alpha = .5, xv = c(2, .75, -1.25))
##D gamnb <- gamlss(nby ~ ., family=NBI, data = sim.data)
##D gamnb
## End(Not run)



