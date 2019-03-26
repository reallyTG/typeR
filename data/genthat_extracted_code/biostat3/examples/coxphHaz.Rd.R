library(biostat3)


### Name: coxphHaz
### Title: Smoothed hazard estimates for 'coxph'
### Aliases: coxphHaz print.coxphHaz plot.coxphHaz plot.coxphHazList
###   lines.coxphHazList
### Keywords: survival

### ** Examples

fit <- coxph(Surv(surv_mm/12,status=="Dead: cancer")~agegrp, data=colon)
newdata <- data.frame(agegrp=levels(colon$agegrp))
haz <- suppressWarnings(coxphHaz(fit,newdata))
plot(haz, xlab="Time since diagnosis (years)")
legend("topright", legend=newdata$agegrp, lty=1:4, col=1:4, bty="n")



