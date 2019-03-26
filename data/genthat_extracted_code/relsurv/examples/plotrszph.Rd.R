library(relsurv)


### Name: plot.rs.zph
### Title: Graphical Inspection of Proportional Hazards Assumption in
###   Relative Survival Models
### Aliases: plot.rs.zph
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
fit <- rsadd(Surv(time,cens)~sex+as.factor(agegr),rmap=list(age=age*365.241),
             ratetable=slopop,data=rdata,int=5)
rszph <- rs.zph(fit)
plot(rszph)



