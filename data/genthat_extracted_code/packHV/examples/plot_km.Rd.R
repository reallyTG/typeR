library(packHV)


### Name: plot_km
### Title: Kaplan-Meier plot with number of subjects at risk below
### Aliases: plot_km

### ** Examples

cgd$time=cgd$tstop-cgd$tstart
plot_km(Surv(time,status)~sex,data=cgd,col=c("blue","red"))



