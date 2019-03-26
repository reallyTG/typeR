library(cir)


### Name: is.DRtrace
### Title: Constructor functions and class-checking functions for DRtrace
###   and doseResponse classes
### Aliases: is.DRtrace is.doseResponse DRtrace doseResponse
###   is.doseResponse is.DRtrace doseResponse

### ** Examples

## Summary of raw data from the notorious Neuenschwander et al. (Stat. Med., 2008) trial
neundatTrace=DRtrace(x=c(rep(1:4,each=4),7,7,rep(6,9)),y=c(rep(0,16),1,1,rep(c(0,0,1),2),0,0,0))
par(mar=c(3,3,3,1),mgp=c(2,.5,0),tcl=-0.25)
layout(t(1:2))
plot(neundatTrace,main="N. et al. (2008) Cohort Trace",ylab="Ordinal Dose Level",cex.main=1.5)

## Same data, in 'doseResponse' format with actual doses rather than dose levels
neundatDose=doseResponse(x=c(1,2.5,5,10,20,25),y=c(rep(0,4),2/9,1),wt=c(3,4,5,4,9,2))
plot(neundatDose,main="N. et al. (2008) Final Dose-Toxicity",ylim=c(0,1),
	xlab="Dose (mg/sq.m./wk)",ylab="Toxicity Response Curve (F)",cex.main=1.5)
## We can also convert the DRtrace object to doseResponse...
neundatLevel=doseResponse(neundatTrace)

### Now plotting the former, vs. IR/CIR estimates
neunCIR0=cirPAVA(neundatDose,full=TRUE)
lines(neunCIR0$shrinkage$x,neunCIR0$shrinkage$y,type='b',pch=19)
legend(1,1,pch=c(4,19),legend=c('Observations','CIR (IR is same)'),bty='n')



