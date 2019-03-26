library(ivtools)


### Name: ivah
### Title: Instrumental variable estimation of the causal exposure effect
###   in additive hazards (AH) models
### Aliases: ivah

### ** Examples


require(ahaz)

set.seed(9)

n <- 1000
psi0 <- 0.2
psi1 <- 0.0

U <- runif(n)
L <- runif(n)
Z <- rbinom(n, 1, plogis(-0.5+L)) 
X <- runif(n, min=Z+U, max=2+Z+U)
T <- rexp(n, rate=psi0*X+psi1*X*L+0.2*U+0.2*L)
C <- 5  #administrative censoring at t=5
d <- as.numeric(T<C)
T <- pmin(T, C) 
data <- data.frame(L, Z, X, T, d)
#break ties
data$T <- data$T+rnorm(n=nrow(data), sd=0.001)

#two-stage estimation
fitX <- glm(formula=X~Z+L, data=data)
fitT <- ah(formula=Surv(T, d)~X+L+X*L, data=data)
fitIV <- ivah(estmethod="ts", fitX=fitX, fitT=fitT, data=data, ctrl=TRUE)
summary(fitIV)

#G-estimation
fitZ <- glm(formula=Z~L, family="binomial", data=data)
fitIV <- ivah(estmethod="g", Z="Z", X="X", T="T", fitZ=fitZ, data=data,  
          event="d", max.time=4, max.time.psi=4, n.sim=100)
summary(fitIV)
plot(fitIV)






