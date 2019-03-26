### R code from vignette source 'treatReg.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: treatReg.Rnw:38-41
###################################################
library(sampleSelection)
options(width=70)
set.seed(0)


###################################################
### code chunk number 2: generate_data
###################################################
N <- 2000
sigma <- 1
rho <- 0.8
Sigma <- matrix(c(1, rho*sigma, rho*sigma, sigma^2), 2, 2)
                           # variance-covariance matrix
uv <- mvtnorm::rmvnorm(N, mean=c(0,0), sigma=Sigma)
                           # bivariate normal RV
u <- uv[,1]
v <- uv[,2]
x <- rnorm(N)              # normal covariates
z <- rnorm(N)
ySX <- -1 + x + z + u      # unobserved participation tendency
yS <- ySX > 0              # observed participation
yO <- x + yS + v
dat <- data.frame(yO, yS, x, z, ySX, u, v)


###################################################
### code chunk number 3: OLS
###################################################
m <- lm(yO ~ x + yS, data=dat)
print(summary(m))


###################################################
### code chunk number 4: treatReg
###################################################
tm <- treatReg(yS ~ x + z, yO ~ x + yS, data=dat)
print(summary(tm))


###################################################
### code chunk number 5: EcdatExample
###################################################
data(Treatment, package="Ecdat")
er <- treatReg(treat~poly(age,2) + educ + u74 + u75 + ethn,
               log(re78)~treat + poly(age,2) + educ + ethn,
               data=Treatment)
print(summary(er))


###################################################
### code chunk number 6: EcdatNoExclusion
###################################################
noer <- treatReg(treat~poly(age,2) + educ + u74 + u75 + ethn,
                 log(re78)~treat + poly(age,2) + educ + u74 + u75 + ethn,
                 data=Treatment)
print(summary(noer))


