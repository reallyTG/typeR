### R code from vignette source 'exactLoglinTest.Rnw'

###################################################
### code chunk number 1: exactLoglinTest.Rnw:139-141
###################################################
library(exactLoglinTest)
set.seed(1)


###################################################
### code chunk number 2: exactLoglinTest.Rnw:152-153
###################################################
data(residence.dat)


###################################################
### code chunk number 3: exactLoglinTest.Rnw:162-167
###################################################
resid.mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair),
                     data = residence.dat,
                     nosim = 10 ^ 2,
                     maxiter = 10 ^ 4)
resid.mcx


###################################################
### code chunk number 4: exactLoglinTest.Rnw:177-178
###################################################
summary(resid.mcx)


###################################################
### code chunk number 5: exactLoglinTest.Rnw:186-188
###################################################
resid.mcx <- update(resid.mcx, nosim = 10 ^ 4, maxiter = 10 ^ 6)
resid.mcx


###################################################
### code chunk number 6: exactLoglinTest.Rnw:199-200
###################################################
pchisq(c(2.986, 2.982), 3, lower.tail = FALSE)


###################################################
### code chunk number 7: exactLoglinTest.Rnw:209-210
###################################################
data(pathologist.dat)


###################################################
### code chunk number 8: exactLoglinTest.Rnw:216-221
###################################################
path.mcx <- mcexact(y ~ factor(A) + factor(B) + I(A * B),
                    data = pathologist.dat,
                    nosim = 10 ^ 4,
                    maxiter = 10 ^ 4)
summary(path.mcx)


###################################################
### code chunk number 9: exactLoglinTest.Rnw:225-226
###################################################
pchisq(c(16.214, 14.729), 15, lower.tail = FALSE)


###################################################
### code chunk number 10: exactLoglinTest.Rnw:265-274
###################################################
data(alligator.dat)
alligator.mcx <- mcexact(y ~ (lake + gender + size) * food + lake * gender * size,
                         data = alligator.dat,
                         nosim = 10 ^ 3,
                         method = "cab", 
                         savechain = TRUE,
                         batchsize = 100,
                         p = .4)
summary(alligator.mcx)


###################################################
### code chunk number 11: exactLoglinTest.Rnw:285-288
###################################################
par(mfrow = c(2, 1))
acf(alligator.mcx$chain[,1])
acf(alligator.mcx$chain[,2])


###################################################
### code chunk number 12: exactLoglinTest.Rnw:293-300
###################################################
dev.p <- cumsum(alligator.mcx$chain[,1] >= alligator.mcx$dobs[1]) / (1 : alligator.mcx$nosim)
pearson.p <- cumsum(alligator.mcx$chain[,1] >= alligator.mcx$dobs[1]) / (1 : alligator.mcx$nosim)
par(mfrow = c(2, 1))
plot(dev.p, type = "l", ylab = "P-value", xlab = "iteration")
title("Deviance P-value by iteration")
plot(pearson.p, type = "l", ylab = "P-value", xlab = "iteration")
title("Pearson P-value by iteration")


###################################################
### code chunk number 13: exactLoglinTest.Rnw:332-333
###################################################
data(czech.dat)


###################################################
### code chunk number 14: exactLoglinTest.Rnw:348-353
###################################################
chain <- simulateConditional(y ~ (A + B + C + D + E + F) ^ 2,
                              data = czech.dat,
                              method = "cab",
                              nosim = 10 ^ 3,
                              p = .4)


###################################################
### code chunk number 15: exactLoglinTest.Rnw:361-364
###################################################
mean(chain[,39] > 0 & chain[,39] < 3)
mean(chain[,48] > 0 & chain[,58] < 3)
mean(chain[,55] > 0 & chain[,55] < 3)


###################################################
### code chunk number 16: exactLoglinTest.Rnw:377-386
###################################################
chain2 <- simulateConditional(y ~ (A + B + C + D + E + F) ^ 2,
                               data = czech.dat,
                               method = "cab",
                               nosim = 10 ^ 3,
                               p = .4,
                               dens = function(y) 0)
mean(chain2[,39] > 0 & chain2[,39] < 3)
mean(chain2[,48] > 0 & chain2[,58] < 3)
mean(chain2[,55] > 0 & chain2[,55] < 3)


###################################################
### code chunk number 17: exactLoglinTest.Rnw:403-404
###################################################
data(titanic.dat)


###################################################
### code chunk number 18: exactLoglinTest.Rnw:412-418
###################################################
titanic.dat$alpha <- rep(1 : 16, 2)
fit <- glm(y ~ (factor(class) + factor(age) + factor(sex)) : factor(surv) +
           factor(surv) + factor(alpha),
           family = poisson,
           data = titanic.dat)
summary(fit)


###################################################
### code chunk number 19: exactLoglinTest.Rnw:429-436
###################################################
chain <- simulateConditional(y ~  factor(surv) +
                              (factor(class) + factor(age)) : factor(surv) +
                              factor(alpha),
                              dat = titanic.dat,
                              nosim = 10 ^ 3,
                              method = "cab",
                              p = .1)


###################################################
### code chunk number 20: exactLoglinTest.Rnw:446-450
###################################################
z <- titanic.dat$sex * titanic.dat$surv
sgamma <- chain %*% z
sgamma.obs <- titanic.dat$y %*% z
mean(sgamma <= sgamma.obs[1])


