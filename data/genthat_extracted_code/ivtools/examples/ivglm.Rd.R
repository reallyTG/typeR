library(ivtools)


### Name: ivglm
### Title: Instrumental variable estimation of the causal exposure effect
###   in generalized linear models
### Aliases: ivglm

### ** Examples


set.seed(9)

##Note: the parameter values in the examples below are chosen to make 
##Y0 independent of Z, which is necessary for Z to be a valid instrument.

n <- 1000
psi0 <- 0.5
psi1 <- 0.2

##---Example 1: linear model and interaction between X and L---

L <- rnorm(n)
Z <- rnorm(n, mean=L)
X <- rnorm(n, mean=Z)
m0 <- X-Z+L 
Y <- rnorm(n, mean=psi0*X+psi1*X*L+m0)
data <- data.frame(L, Z, X, Y)

#two-stage estimation
fitX <- glm(formula=X~Z, data=data)
fitY <- glm(formula=Y~X+L+X*L, data=data)
fitIV <- ivglm(estmethod="ts", fitX=fitX, fitY=fitY, data=data, ctrl=TRUE) 
summary(fitIV)

#G-estimation
fitZ <- glm(formula=Z~L, data=data)
fitIV <- ivglm(estmethod="g", Z="Z", X="X", Y="Y", fitZ=fitZ, data=data, 
  formula=~L, link="identity")
summary(fitIV)

##---Example 2: logistic model and no covariates--- 

Z <- rbinom(n, 1, 0.5)
X <- rbinom(n, 1, 0.7*Z+0.2*(1-Z)) 
m0 <- plogis(1+0.8*X-0.39*Z)
Y <- rbinom(n, 1, plogis(psi0*X+log(m0/(1-m0)))) 
data <- data.frame(Z, X, Y)

#two-stage estimation
fitX <- glm(formula=X~Z, family="binomial", data=data)
fitY <- glm(formula=Y~X, family="binomial", data=data)
fitIV <- ivglm(estmethod="ts", fitX=fitX, fitY=fitY, data=data, ctrl=TRUE) 
summary(fitIV)

#G-estimation
fitY <- glm(formula=Y~X+Z+X*Z, family="binomial", data=data)
fitIV <- ivglm(estmethod="g", Z="Z", X="X", Y="Y", fitY=fitY, data=data, link="logit")
summary(fitIV)





