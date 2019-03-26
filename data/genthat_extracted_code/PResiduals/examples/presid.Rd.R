library(PResiduals)


### Name: presid
### Title: Probability-scale residual
### Aliases: presid

### ** Examples

library(survival)
library(stats)

set.seed(100)
n <- 1000
x <- rnorm(n)
t <- rweibull(n, shape=1/3, scale=exp(x))
c <- rexp(n, 1/3)
y <- pmin(t, c)
d <- ifelse(t<=c, 1, 0)

mod.survreg <- survreg(Surv(y, d) ~ x, dist="weibull")
summary(presid(mod.survreg))
plot(x, presid(mod.survreg))

##### example for proprotional hazards model
n <- 1000
x <- rnorm(n)
beta0 <- 1
beta1 <- 0.5
t <- rexp(n, rate = exp(beta0 + beta1*x))
c <- rexp(n, rate=1)
y <- ifelse(t<c, t, c)
delta <- as.integer(t<c)

mod.coxph <- coxph(Surv(y, delta) ~ x)
presid <- presid(mod.coxph)
plot(x, presid, cex=0.4, col=delta+2)

#### example for Negative Binomial regression
library(MASS)

n <- 1000
beta0 <- 1
beta1 <- 0.5
x <- runif(n, min=-3, max=3)
y <- rnbinom(n, mu=exp(beta0 + beta1*x), size=3)

mod.glm.nb <- glm.nb(y~x)
presid <- presid(mod.glm.nb)
summary(presid)
plot(x, presid, cex=0.4)

##### example for proportional odds model
library(MASS)

n <- 1000
x  <- rnorm(n)
y  <- numeric(n)
alpha = c(-1, 0, 1, 2)
beta <- 1
py  <-  (1 + exp(- outer(alpha, beta*x, "+"))) ^ (-1)
aa = runif(n)
for(i in 1:n)
  y[i] = sum(aa[i] > py[,i])
y <-  as.factor(y)


mod.polr <- polr(y~x, method="logistic")
summary(mod.polr)
presid <- presid(mod.polr)
summary(presid)
plot(x, presid, cex=0.4)



