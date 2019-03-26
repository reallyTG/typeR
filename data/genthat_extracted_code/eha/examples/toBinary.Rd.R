library(eha)


### Name: toBinary
### Title: Transforms a "survival" data frame into a data frame suitable
###   for binary (logistic) regression
### Aliases: toBinary
### Keywords: cluster survival

### ** Examples


enter <- rep(0, 4)
exit <- 1:4
event <- rep(1, 4)
z <- rep(c(-1, 1), 2)
dat <- data.frame(enter, exit, event, z)
binDat <- toBinary(dat)
dat
binDat
coxreg(Surv(enter, exit, event) ~ z, method = "ml", data = dat)
## Same as:
summary(glm(event ~ z + riskset, data = binDat, family = binomial(link = cloglog)))




