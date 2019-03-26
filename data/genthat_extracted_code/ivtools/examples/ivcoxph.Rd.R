library(ivtools)


### Name: ivcoxph
### Title: Instrumental variable estimation of the causal exposure effect
###   in Cox proportional hazards (PH) models
### Aliases: ivcoxph

### ** Examples


require(survival)

set.seed(9)

##Note: the parameter values in the examples below are chosen to make 
##Y0 independent of Z, which is necessary for Z to be a valid instrument.

n <- 10000
psi0 <- 0.5
Z <- rbinom(n, 1, 0.5)
X <- rbinom(n, 1, 0.7*Z+0.2*(1-Z))
m0 <- exp(0.8*X-0.41*Z) #T0 independent of Z at t=1
T <- rexp(n, rate=exp(psi0*X+log(m0)))
C <- rexp(n, rate=exp(psi0*X+log(m0))) #50% censoring
d <- as.numeric(T<C)
T <- pmin(T, C)
data <- data.frame(Z, X, T, d)

#two-stage estimation
fitX <- glm(formula=X~Z, data=data)
fitT <- coxph(formula=Surv(T, d)~X, data=data)
fitIV <- ivcoxph(estmethod="ts", fitX=fitX, fitT=fitT, data=data, ctrl=TRUE)
summary(fitIV)

#G-estimation with non-parametric model for S(t|L,Z,X)
fitT <- survfit(Surv(T, d)~X+Z, data=data)
fitIV <- ivcoxph(estmethod="g", Z="Z", X="X", T="T", fitT=fitT, data=data, t=1)
summary(fitIV)

#G-estimation with Cox model for \lambda(t|L,Z,X)
fitT <- coxph(Surv(T, d)~X+X+X*Z, data=data)
fitIV <- ivcoxph(estmethod="g", Z="Z", X="X", T="T", fitT=fitT, data=data, t=1)
summary(fitIV)




