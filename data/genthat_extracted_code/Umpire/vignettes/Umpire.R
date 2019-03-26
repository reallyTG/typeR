### R code from vignette source 'Umpire.Rnw'

###################################################
### code chunk number 1: Umpire.Rnw:36-40
###################################################
options(width=88)
options(SweaveHooks = list(fig = function() par(bg='white')))
if (!file.exists("Figures")) dir.create("Figures")
set.seed(774247)


###################################################
### code chunk number 2: lib
###################################################
library(Umpire)


###################################################
### code chunk number 3: indn
###################################################
nGenes <- 3
means <- rnorm(nGenes, 6, 1)
sds <- 1/rgamma(nGenes, rate=14, shape=6)
indn <- IndependentNormal(means, sds)
summary(indn)
indn


###################################################
### code chunk number 4: randn
###################################################
x <- rand(indn, 5)
x


###################################################
### code chunk number 5: indn
###################################################
nGenes <- 4
logmu <- rnorm(nGenes, 6, 1)
logsigma <- 1/rgamma(nGenes, rate=14, shape=6)
indLN <- IndependentLogNormal(logmu, logsigma)
indLN


###################################################
### code chunk number 6: mvn
###################################################
a <- runif(1)
b <- sqrt(1-a^2)
X <- matrix(c(a, b, -b, a), 2, 2)


###################################################
### code chunk number 7: mvn2
###################################################
Lambda2 <- diag(rev(sort(rexp(2))), 2)


###################################################
### code chunk number 8: mvn3
###################################################
Y <- t(X) %*% Lambda2 %*% X


###################################################
### code chunk number 9: mvn4
###################################################
mvn <- MVN(c(0,0), Y)


###################################################
### code chunk number 10: mvn5
###################################################
x <- rand(mvn, 5)


###################################################
### code chunk number 11: eng
###################################################
engine <- Engine(list(indn, mvn))
summary(engine)


###################################################
### code chunk number 12: data
###################################################
data <- rand(engine, 5)
data


###################################################
### code chunk number 13: nm
###################################################
noise <- NoiseModel(30, 40, 0.10)
noise


###################################################
### code chunk number 14: temp
###################################################
ndata <- blur(noise, data)
summary(data)
summary(ndata)


###################################################
### code chunk number 15: standard
###################################################
nGenes <- 4000
mu0 <- 6
sigma0 <- 1.5
rate <- 28.11
shape <- 44.25
logmu <- rnorm(nGenes, mu0, sigma0)
logsigma <- 1/rgamma(nGenes, rate=rate, shape=shape)
indLN <- IndependentLogNormal(logmu, logsigma)
engine <- Engine(list(indLN))


###################################################
### code chunk number 16: act
###################################################
p0 <- 0.8
engine <- EngineWithActivity(p0, list(indLN))
summary(engine)


###################################################
### code chunk number 17: getwd
###################################################
getwd()


###################################################
### code chunk number 18: si
###################################################
sessionInfo()


