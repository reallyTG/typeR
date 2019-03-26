library(mstate)


### Name: crprep
### Title: Function to create weighted data set for competing risks
###   analyses
### Aliases: crprep crprep.default
### Keywords: datagen survival

### ** Examples

data(aidssi)
aidssi.w <- crprep("time", "cause", data=aidssi, trans=c("AIDS","SI"),
                   cens="event-free", id="patnr", keep="ccr5")

# calculate cause-specific cumulative incidence, no truncation,
# compare with Cuminc (also from mstate)
ci <- Cuminc(aidssi$time, aidssi$status)
sf <- survfit(Surv(Tstart,Tstop,status=="AIDS")~1, data=aidssi.w,
              weight=weight.cens, subset=failcode=="AIDS")
plot(sf, fun="event", mark.time=FALSE)
lines(CI.1~time,data=ci,type="s",col="red")
sf <- survfit(Surv(Tstart,Tstop,status=="SI")~1, data=aidssi.w,
              weight=weight.cens, subset=failcode=="SI")
plot(sf, fun="event", mark.time=FALSE)
lines(CI.2~time,data=ci,type="s",col="red")

# Fine and Gray regression for cause 1
cw <- coxph(Surv(Tstart,Tstop,status=="AIDS")~ccr5, data=aidssi.w,
      weight=weight.cens, subset=failcode=="AIDS")
cw
# This can be checked with the results of crr (cmprsk)
# crr(ftime=aidssi$time, fstatus=aidssi$status, cov1=as.numeric(aidssi$ccr5))

# Gray's log-rank test
aidssi.wCCR <- crprep("time", "cause", data=aidssi, trans=c("AIDS","SI"),
                      cens="event-free", id="patnr", strata="ccr5")
test.AIDS <- coxph(Surv(Tstart,Tstop,status=="AIDS")~ccr5, data=aidssi.wCCR,
                   weights=weight.cens, subset=failcode=="AIDS")
test.SI <- coxph(Surv(Tstart,Tstop,status=="SI")~ccr5, data=aidssi.wCCR,
                 weights=weight.cens, subset=failcode=="SI")
## score test statistic and p-value
c(test.AIDS$score, 1-pchisq(test.AIDS$score,1)) # AIDS
c(test.SI$score, 1-pchisq(test.SI$score,1))     # SI
# This can be compared with the results of cuminc (cmprsk)
# with(aidssi, cuminc(time, status, group=ccr5)$Tests)
# Note: results are not exactly the same



