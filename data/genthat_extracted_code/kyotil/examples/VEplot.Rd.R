library(kyotil)


### Name: VEplot
### Title: Vaccine Efficacy Plots
### Aliases: VEplot VEplot.cox.zph myplot.cox.zph

### ** Examples


library(survival)
vfit <- coxph(Surv(time,status) ~ trt + factor(celltype) + 
              karno + age, data=veteran, x=TRUE) 
temp <- cox.zph(vfit) 

par(mfrow=c(2,2))
for (v in c("trt","age")) {
    VEplot(temp, var=v, resid=FALSE, main=v, ylab="VE", cex.axis=1.5)
    plot(temp, var=v, resid=FALSE, main=v)
}




