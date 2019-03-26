library(stdReg)


### Name: stdParfrailty
### Title: Regression standardization in shared frailty gamma-Weibull
###   models
### Aliases: stdParfrailty

### ** Examples


require(survival)

#simulate data
n <- 1000
m <- 3
alpha <- 1.5
eta <- 1
phi <- 0.5
beta <- 1
id <- rep(1:n, each=m)
U <- rep(rgamma(n, shape=1/phi, scale=phi), each=m)
X <- rnorm(n*m)
#reparametrize scale as in rweibull function
weibull.scale <- alpha/(U*exp(beta*X))^(1/eta)
T <- rweibull(n*m, shape=eta, scale=weibull.scale)

#right censoring
C <- runif(n*m, 0, 10)
D <- as.numeric(T<C)
T <- pmin(T, C)
  
#strong left-truncation
L <- runif(n*m, 0, 2)
incl <- T>L
incl <- ave(x=incl, id, FUN=sum)==m
dd <- data.frame(L, T, D, X, id)
dd <- dd[incl, ]  
 
fit <- parfrailty(formula=Surv(L, T, D)~X, data=dd, clusterid="id")
fit.std <- stdParfrailty(fit=fit, data=dd, X="X", x=seq(-1,1,0.5), t=1:5, clusterid="id")
print(summary(fit.std, t=3))
plot(fit.std)




