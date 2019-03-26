library(mstate)


### Name: LMAJ
### Title: Landmark Aalen-Johansen method
### Aliases: LMAJ
### Keywords: survival

### ** Examples

data(prothr)
tmat <- attr(prothr, "trans")
pr0 <- subset(prothr, treat=="Placebo")
attr(pr0, "trans") <- tmat
pr1 <- subset(prothr, treat=="Prednisone")
attr(pr1, "trans") <- tmat
c0 <- coxph(Surv(Tstart, Tstop, status) ~ strata(trans), data=pr0)
c1 <- coxph(Surv(Tstart, Tstop, status) ~ strata(trans), data=pr1)
msf0 <- msfit(c0, trans=tmat)
msf1 <- msfit(c1, trans=tmat)
# Comparison as in Figure 2 of Titman (2015)
# Aalen-Johansen
pt0 <- probtrans(msf0, predt=1000)[[2]]
pt1 <- probtrans(msf1, predt=1000)[[2]]
par(mfrow=c(1,2))
plot(pt0$time, pt0$pstate1, type="s", lwd=2, xlim=c(1000,4000), ylim=c(0,0.61),
     xlab="Time since randomisation (days)", ylab="Probability")
lines(pt1$time, pt1$pstate1, type="s", lwd=2, lty=3)
legend("topright", c("Placebo", "Prednisone"), lwd=2, lty=1:2, bty="n")
title(main="Aalen-Johansen")
# Landmark Aalen-Johansen
LMpt0 <- LMAJ(msdata=pr0, s=1000, from=2)
LMpt1 <- LMAJ(msdata=pr1, s=1000, from=2)
plot(LMpt0$time, LMpt0$pstate1, type="s", lwd=2, xlim=c(1000,4000), ylim=c(0,0.61),
     xlab="Time since randomisation (days)", ylab="Probability")
lines(LMpt1$time, LMpt1$pstate1, type="s", lwd=2, lty=3)
legend("topright", c("Placebo", "Prednisone"), lwd=2, lty=1:2, bty="n")
title(main="Landmark Aalen-Johansen")



