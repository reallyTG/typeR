### R code from vignette source 'heavytails.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: preliminaries
###################################################
options(prompt = 'R> ', continue = '+  ')


###################################################
### code chunk number 2: data
###################################################
library(stochvol)
data(exrates)
par(mfrow = c(2, 1), mar = c(1.7, 1.7, 1.7, 0.1), mgp = c(1.6, 0.6, 0))
plot(exrates$date, exrates$CHF, type = 'l', main = 'Price of 1 EUR in CHF')
dat <- logret(exrates$CHF, demean = TRUE)
plot(exrates$date[-1], dat, type = 'l', main = 'Demeaned log returns')


###################################################
### code chunk number 3: terr
###################################################
rest <- svsample(dat, priormu = c(-12, 1), priorphi = c(20, 1.1),
  priorsigma = 0.1, priornu = c(2, 100), burnin = 2000)
plot(rest, showobs = FALSE)


