### R code from vignette source 'RoeDeerMass-simulation.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: lib (eval = FALSE)
###################################################
## install.packages("OnAge")


###################################################
### code chunk number 2: lib
###################################################
library(OnAge)


###################################################
### code chunk number 3: data
###################################################
data(RoeDeerMassData)
RoeDeerMassData$ID <- factor(RoeDeerMassData$ID)
RoeDeerMassData$cohort <- factor(RoeDeerMassData$cohort)

dataFCH <- RoeDeerMassData[RoeDeerMassData$sex%in%"F"&
                             RoeDeerMassData$population%in%"CH", ]
dataMCH <- RoeDeerMassData[RoeDeerMassData$sex%in%"M"&
                             RoeDeerMassData$population%in%"CH", ]
dataFTF <- RoeDeerMassData[RoeDeerMassData$sex%in%"F"&
                             RoeDeerMassData$population%in%"TF", ]
dataMTF <- RoeDeerMassData[RoeDeerMassData$sex%in%"M"&
                             RoeDeerMassData$population%in%"TF", ]


###################################################
### code chunk number 4: model
###################################################
## b1: function for piecewise regression (transforms x into 0 before bp)
b1 <- function(x, bp) ifelse(x < bp, 0, x - bp)

## Use this function to define the model in which the differential
## onset hypothesis is tested.
ll.real <- function(thr, dataIn){
  logLik(lme4::lmer(body.mass ~ b1(age, thr) + age.at.last.capture + 
                      last.year.of.capture + (1|ID) + (1|cohort),
                    data=dataIn, REML="FALSE"))
}

## Same model using simulated body mass
ll.sim <- function(thr, dataIn){
  logLik(lme4::lmer(body.mass.sim ~ b1(age, thr) + age.at.last.capture + 
                      last.year.of.capture + (1|ID) + (1|cohort),
                    data=dataIn, REML="FALSE"))
}


###################################################
### code chunk number 5: test
###################################################
search.range <- c(6, 12)
search.range.TF <- search.range.CH <- search.range


###################################################
### code chunk number 6: testTF
###################################################
res.tf <- onset.test(ll.real, dataFTF, dataMTF, search.range.TF,
  do.plot=TRUE)


###################################################
### code chunk number 7: testCH
###################################################
res.ch <- onset.test(ll.real, dataFCH, dataMCH, search.range.CH,
   do.plot=TRUE)


###################################################
### code chunk number 8: test-result
###################################################
cat(sprintf("p-value for differential age at onset is %g in 
  Trois Fontaines, %g in Chizé", res.tf$pv, res.ch$pv))


###################################################
### code chunk number 9: simulation
###################################################
sfunc <- function(dataIn, b1, thr, bw.offset, age.effect, 
                  age.last.effect, last.effect, id.s2, coh.s2, s2){
  
    id.dum <- sapply(levels(dataIn$ID), 
      FUN=function(ll) 1*(levels(dataIn$ID)[dataIn$ID] == ll))
    id.effect <- matrix(rnorm(ncol(id.dum), sd=sqrt(id.s2)), ncol=1)
  
    coh.dum <- sapply(levels(dataIn$cohort), 
      FUN=function(ll) 1*(levels(dataIn$cohort)[dataIn$cohort] == ll))
    coh.effect <- matrix(rnorm(ncol(coh.dum), sd=sqrt(coh.s2)), ncol=1)
  
    dataIn$body.mass.sim <- bw.offset + 
      (b1(dataIn$age, thr) * age.effect + 
         dataIn$age.at.last.capture * age.last.effect +
         dataIn$last.year.of.capture * last.effect + 
         id.dum %*% id.effect +
         coh.dum %*% coh.effect + 
         rnorm(nrow(dataIn), sd=sqrt(s2)))
  
    return(dataIn)
}

## Noise level in the linear model
s2 <- 10
## True onset for males and females under H0
thr.m <- thr.f <- 7
## Difference of onsets under H1
thr.delta <- 2
## Baseline body mass
bw.offset <- 10
## Fixed effects on bw
age.effect <- -1
age.last.effect <- 1
last.effect <- 1
## Variance of random effects on bw
id.s2 <- 1
coh.s2 <- 1


###################################################
### code chunk number 10: load-simu
###################################################
# data('pre-computed-simulation')
load(file = "pre-computed-simulation.RData")


###################################################
### code chunk number 11: run (eval = FALSE)
###################################################
## ## Number of simulations we want to run under H0 and H1.
## n.h0 <- 5000
## n.h1 <- 5000
## n.rep <- n.h0 + n.h1
## 
## pv.tf <- pv.ch <- llr.tf <- llr.ch <- 
##   lh1.tf <- lh1.ch <- lh0.tf <- lh0.ch <- rep(NA, n.rep)
## 
## cvg.tf <- cvg.ch <- rep(NA, n.rep)
## warn.tf <- warn.ch <- rep(FALSE, n.rep)
## 
## data.f.ch <- data.m.ch <- data.f.tf <- data.m.tf <- list()
## 
## ftf.grad <- ftf.feval <- ftf.joint.grad <- ftf.joint.feval <- rep(NA, n.rep) 
## mtf.grad <- mtf.feval <- mtf.joint.grad <- mtf.joint.feval <- rep(NA, n.rep) 
## fch.grad <- fch.feval <- fch.joint.grad <- fch.joint.feval <- rep(NA, n.rep) 
## mch.grad <- mch.feval <- mch.joint.grad <- mch.joint.feval <- rep(NA, n.rep) 
## 
## ## Range over which we optimize the onset. In this example, going up
## ## to 17 yo makes the simulation unstable: the loglikelihood under H1
## ## has a (suboptimal) local maximum in large values (for which we have
## ## few samples), leading to inaccurate (and sometimes negative)
## ## loglikelihood ratio statistics.
## search.range <- c(6, 12) # data not available before 6 years old
## search.range.TF <- search.range.CH <- search.range
## 
## ## Main loop for simulations
## for(rr in 1:n.rep){
##     print(rr)
##     ## Simulate data from the Chizé population
##     data.f.ch[[rr]] <- sfunc(dataFCH, b1, thr.f, bw.offset, age.effect, 
##         age.last.effect, last.effect, id.s2, coh.s2, s2)
##     data.m.ch[[rr]] <- sfunc(dataMCH, b1, thr.m, bw.offset, age.effect, 
##         age.last.effect, last.effect, id.s2, coh.s2, s2)
##     
##     ## Simulate data from the Trois Fontaines population
##     data.f.tf[[rr]] <- sfunc(dataFTF, b1, thr.f, bw.offset, age.effect, 
##         age.last.effect, last.effect, id.s2, coh.s2, s2)
##     data.m.tf[[rr]] <- sfunc(dataMTF, b1, thr.m, bw.offset, age.effect, 
##         age.last.effect, last.effect, id.s2, coh.s2, s2)
##     
##     ## Compute the likelihood ratio test for this Trois Fontaines simulation
##     test.TF <- tryCatch({res=onset.test(ll.sim, data.f.tf[[rr]], 
##           data.m.tf[[rr]], search.range.TF, CI.lvl=NA)
##         res$warn=FALSE
##         res},
##         warning=function(w) {
##             res <- onset.test(ll.sim, data.f.tf[[rr]], 
##               data.m.tf[[rr]], search.range.TF, CI.lvl=NA)
##             res$warn <- TRUE
##             return(res)
##         })
##     llr.tf[rr] <- test.TF$llr
##     lh1.tf[rr] <- test.TF$lh1
##     lh0.tf[rr] <- test.TF$lh0
##     pv.tf[rr] <- test.TF$pv
##     cvg.tf[rr] <- test.TF$cvg.ok
##     warn.tf[rr] <- test.TF$warn
##     ## Compute the likelihood ratio test for this Chizé simulation
##     test.CH <- tryCatch({res=onset.test(ll.sim, data.f.ch[[rr]], 
##           data.m.ch[[rr]], search.range.CH, CI.lvl=NA)
##         res$warn=FALSE
##         res},
##         warning=function(w) {
##             res <- onset.test(ll.sim, data.f.ch[[rr]], 
##               data.m.ch[[rr]], search.range.CH, CI.lvl=NA)
##             res$warn <- TRUE
##             return(res)
##         })
##     llr.ch[rr] <- test.CH$llr
##     lh1.ch[rr] <- test.CH$lh1
##     lh0.ch[rr] <- test.CH$lh0
##     pv.ch[rr] <- test.CH$pv
##     cvg.ch[rr] <- test.CH$cvg.ok
##     warn.ch[rr] <- test.CH$warn
##     
##     ## Optimality check: amplitude of the gradient (should be close to
##     ## 0) and number of function evaluation (if equal to the largest
##     ## allowed value, it is likely that the optimization did not
##     ## converge).
##     ftf.lm <- lmer(body.mass.sim ~ b1(age, test.TF$est.1) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.f.tf[[rr]], REML='FALSE')
##     
##     mtf.lm <- lmer(body.mass.sim ~ b1(age, test.TF$est.2) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.m.tf[[rr]], REML='FALSE')
##     
##     ftf.joint.lm <- lmer(body.mass.sim ~ b1(age, test.TF$est.joint) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.f.tf[[rr]], REML='FALSE')
##     
##     mtf.joint.lm <- lmer(body.mass.sim ~ b1(age, test.TF$est.joint) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.m.tf[[rr]], REML='FALSE')
##     
##     fch.lm <- lmer(body.mass.sim ~ b1(age, test.CH$est.1) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.f.ch[[rr]], REML='FALSE')
## 
##     mch.lm <- lmer(body.mass.sim ~ b1(age, test.CH$est.2) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.m.ch[[rr]], REML='FALSE')
##     
##     fch.joint.lm <- lmer(body.mass.sim ~ b1(age, test.CH$est.joint) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.f.ch[[rr]], REML='FALSE')
##     
##     mch.joint.lm <- lmer(body.mass.sim ~ b1(age, test.CH$est.joint) + 
##       age.at.last.capture + last.year.of.capture + 
##       (1|ID) + (1|CohortF), data=data.m.ch[[rr]], REML='FALSE')
##     
##     ftf.grad[rr] <- max(abs(ftf.lm@optinfo$derivs$gradient))
##     ftf.feval[rr] <- ftf.lm@optinfo$feval
##     mtf.grad[rr] <- max(abs(mtf.lm@optinfo$derivs$gradient))
##     mtf.feval[rr] <- mtf.lm@optinfo$feval
##     ftf.joint.grad[rr] <- max(abs(ftf.joint.lm@optinfo$derivs$gradient))
##     ftf.joint.feval[rr] <- ftf.joint.lm@optinfo$feval
##     mtf.joint.grad[rr] <- max(abs(mtf.joint.lm@optinfo$derivs$gradient))
##     mtf.joint.feval[rr] <- mtf.joint.lm@optinfo$feval
##     fch.grad[rr] <- max(abs(fch.lm@optinfo$derivs$gradient))
##     fch.feval[rr] <- fch.lm@optinfo$feval
##     mch.grad[rr] <- max(abs(mch.lm@optinfo$derivs$gradient))
##     mch.feval[rr] <- mch.lm@optinfo$feval
##     fch.joint.grad[rr] <- max(abs(fch.joint.lm@optinfo$derivs$gradient))
##     fch.joint.feval[rr] <- fch.joint.lm@optinfo$feval
##     mch.joint.grad[rr] <- max(abs(mch.joint.lm@optinfo$derivs$gradient))
##     mch.joint.feval[rr] <- mch.joint.lm@optinfo$feval
##     
##     if(rr == n.h0){
##       thr.f = thr.m + thr.delta
##     }
## }


###################################################
### code chunk number 12: cvg
###################################################
cat(sprintf('Negative log-likelihood obtained in proportion %g of the Trois
  Fontaine and %g of the Chizé simulations', mean(!cvg.tf), mean(!cvg.ch)))


###################################################
### code chunk number 13: optim
###################################################
summary(ftf.grad)
summary(mtf.grad)
summary(ftf.joint.grad)
summary(mtf.joint.grad)
summary(fch.grad)
summary(mch.grad)
summary(fch.joint.grad)
summary(mch.joint.grad)

summary(ftf.feval)
summary(mtf.feval)
summary(ftf.joint.feval)
summary(mtf.joint.feval)
summary(fch.feval)
summary(mch.feval)
summary(fch.joint.feval)
summary(mch.joint.feval)


###################################################
### code chunk number 14: load-failed-run (eval = FALSE)
###################################################
## failed.simulation <- which(!cvg.tf)[1]
## failed.f.tf <- data.f.tf[[failed.simulation]]
## failed.m.tf <- data.m.tf[[failed.simulation]]


###################################################
### code chunk number 15: profile-simu-plot
###################################################
res.failed.tf <- onset.test(ll.sim, failed.f.tf, failed.m.tf, 
                            search.range.TF, do.plot=TRUE)


###################################################
### code chunk number 16: QQPlot
###################################################
oldpar <- par()
par(mfrow=c(1, 2), pty="s", mar=c(2, 6, 1, 1)+0.1)
qqplot(rchisq(1e4, 1), llr.ch[1:n.h0], main='Chizé', pch=20,
  xlab=expression(chi[2](1) ~ 'quantiles'), ylab=expression(
    'Empirical quantiles of the log-likelihood ratio test statistic under'~H[0]))
abline(a=0, b=1, col='red')
qqplot(rchisq(1e4, 1), llr.tf[1:n.h0], main='Trois Fontaines', pch=20,
  xlab=expression(chi[2](1) ~ 'quantiles'), ylab=expression(
    'Empirical quantiles of the log-likelihood ratio test statistic under'~H[0]))
abline(a=0, b=1, col='red')
par(oldpar)


###################################################
### code chunk number 17: calibration
###################################################
ch.thr <- unique(sort(pv.ch))
tf.thr <- unique(sort(pv.tf))
ch.lvl <- ch.pwr <- rep(-1, length(ch.thr))
tf.lvl <- tf.pwr <- rep(-1, length(tf.thr))
for(tt in 1:length(ch.thr)){
    ch.lvl[tt] <- mean((pv.ch[1:n.h0] <= ch.thr[tt]))
    ch.pwr[tt] <- mean((pv.ch[-(1:n.h0)] <= ch.thr[tt]))
}
for(tt in 1:length(tf.thr)){
    tf.lvl[tt] <- mean((pv.tf[1:n.h0] <= tf.thr[tt]))
    tf.pwr[tt] <- mean((pv.tf[-(1:n.h0)] <= tf.thr[tt]))
}
par(pty="s", mar=c(2, 4, 0, 2) + 0.1)
plot(ch.thr, ch.lvl, cex.lab=1.5,
     xlab='P-value threshold', 
     ylab='False positive rate', 
     col='blue', type="s", lwd=2,
     xlim=c(0, 0.1), ylim=c(0, 0.1))
lines(tf.thr, tf.lvl, col='red', type='l',lwd=2)
abline(a=0, b=1)
legend("bottomright", c('Chizé', 'Trois Fontaines'), lwd=2,
       col=c('blue', 'red'))


###################################################
### code chunk number 18: ROC
###################################################
## Plot calibration and ROC curve
par(pty="s", mar=c(2, 4, 0, 2) + 0.1)
plot(ch.lvl, ch.pwr, cex.lab=1.5,
     xlab='False positive rate',
     ylab='True positive rate',
     col='blue', type="s", lwd=2)
lines(tf.lvl, tf.pwr, col='red', type='l', lwd=2)
abline(a=0, b=1)
legend("bottomright", c('Chizé', 'Trois Fontaines'), lwd=2,
       col=c('blue', 'red'))


###################################################
### code chunk number 19: sessionInfo
###################################################
sessionInfo()


