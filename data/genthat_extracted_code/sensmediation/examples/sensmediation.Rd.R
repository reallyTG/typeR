library(sensmediation)


### Name: sensmediation
### Title: Estimate natural direct and indirect effects based on parametric
###   regression models and perform sensitivity analysis
### Aliases: sensmediation

### ** Examples


#Examples with simulated data

#######################################
# Binary mediator, continuous outcome #
#######################################

###Binary exposure:

##Simulated data:
require(mvtnorm)
require(maxLik)

n <- 1000
set.seed(102677)

x <- rnorm(n)

z.star <- -0.5 + 0.1*x + rnorm(n)
z <- ifelse(z.star > 0, 1, 0)

R <- 0.5
Sigma <- cbind(c(1,R), c(R,1))
epsilon <- rmvnorm(n, sigma = Sigma)

m.star <- -1.2 + 0.8*z + 0.13*x + epsilon[,1]
m <- ifelse(m.star > 0, 1, 0)

y <- -1 + 0.05*z + 3*m + 0.5*x + epsilon[,2]

#Models:
z.model <- glm(z ~ x, family = binomial(link = 'probit'))
m.model <- glm(m ~ z + x, family = binomial(link = 'probit'))
y.model <- glm(y ~ z + m + x)


##Estimation of NIE, NDE and sensitivity analyses to mediator-outcome confounding:
effects.my <- sensmediation(med.model = m.model, out.model = y.model, exp.name = "z",
              med.name = "m", Rho = seq(0, 0.5, 0.1))
summary(effects.my)
summary(effects.my, non.sign = TRUE)
plot(effects.my)
plot(effects.my, effect="direct")

##Estimation of NIE, NDE and sensitivity analyses to exposure-mediator confounding:
## Not run: 
##D   effects.zm <- sensmediation(med.model = m.model, out.model = y.model, exp.model = z.model,
##D             type = "zm", Rho = seq(0, 0.5, 0.1), exp.name = "z", med.name = "m")
##D   summary(effects.zm)
## End(Not run)

##Additional effects using more.effects:
#Results with conf.level = 0.99:
effects.my.99 <- more.effects(sensmed.object = effects.my, conf.level = 0.99)
summary(effects.my.99)
#Conditional effects and sensitivity analysis to mediator-outcome confounding:
eff.my.cond <- more.effects(sensmed.object = effects.my, covariates = list(x = 1))
summary(eff.my.cond)


###Continuous exposure:
#Models:
z.model.cont <- glm(z.star ~ x)
m.model.contz <- glm(m ~ z.star + x, family=binomial(link='probit'))
y.model.contz <- glm(y ~ z.star + m + x)

##Estimation of NIE, NDE and sensitivity analyses to mediator-outcome confounding:
eff.my.contz <- sensmediation(med.model = m.model.contz, out.model = y.model.contz,
           Rho = seq(0, 0.5, 0.1), exp.name = "z.star", med.name = "m",
           control.value = 0, exp.value = 2)
summary(eff.my.contz)

##Estimation of NIE, NDE and sensitivity analyses to exposure-mediator confounding:
eff.zm.contz <- sensmediation(med.model = m.model.contz, out.model = y.model.contz,
                 exp.model = z.model.cont, type = "zm", Rho = seq(0, 0.5, 0.1),
                 exp.name = "z.star", med.name = "m", control.value = 0, exp.value = 2)
summary(eff.zm.contz)





