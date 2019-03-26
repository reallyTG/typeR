library(sensmediation)


### Name: coefs.sensmed
### Title: ML estimation of regression parameters for calculation of direct
###   and indirect effects under unobserved confounding
### Aliases: coefs.sensmed

### ** Examples


require(mvtnorm)

n <- 1000
set.seed(102677)
x <- rnorm(n)
z.star <- -0.5 + 0.1*x + rnorm(n)
z <- ifelse(z.star > 0, 1, 0)

#Generating correlated error terms for the mediator and outcome models:
R <- 0.5
Sigma <- cbind(c(1,R), c(R,1))
epsilon <- rmvnorm(n, sigma = Sigma)

m.star <- -1.2 + 0.14*z + 0.13*x + epsilon[,1]
m <- ifelse(m.star > 0,1,0)
y <- -1 + 0.05*z + 1.5*m + 0.5*x + epsilon[,2]

#Models:
z.model <- glm(z ~ x, family=binomial(link='probit'))
m.model <- glm(m ~ z + x, family=binomial(link='probit'))
y.model <- glm(y ~ z + m + x)

#Estimation of regression coefficients under different values of Rho
#Rho = correlation between error terms in mediator and outcome model:
coefs.MY <- coefs.sensmed(model.expl = m.model, model.resp = y.model, Rho = seq(0, 0.5, 0.1))
#Outcome model regression coefficients:
coefs.MY$coef

#Rho = correlation between error terms in exposure and outcome model:
coefs.ZY <- coefs.sensmed(model.expl = z.model, model.resp = y.model, Rho = seq(0, 0.5, 0.1))
#Outcome model regression coefficients:
coefs.ZY$coef




