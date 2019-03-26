library(packHV)


### Name: IC_RR_coxph
### Title: RR and their confidence intervals for Cox models
### Aliases: IC_RR_coxph

### ** Examples

cgd$time=cgd$tstop-cgd$tstart
IC_RR_coxph(coxph(Surv(time,status)~sex+age,data=cgd),alpha=0.05,sided=1)



