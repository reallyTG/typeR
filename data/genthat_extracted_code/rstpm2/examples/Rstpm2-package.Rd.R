library(rstpm2)


### Name: Rstpm2-package
### Title: Flexible parametric survival models.
### Aliases: Rstpm2-package Rstpm2
### Keywords: package

### ** Examples

data(brcancer)
summary(fit <- stpm2(Surv(rectime,censrec==1)~hormon,data=brcancer,df=3))
summary(fit.tvc <- stpm2(Surv(rectime,censrec==1)~hormon,data=brcancer,df=3,
                     tvc=list(hormon=3)))
anova(fit,fit.tvc)
plot(fit.tvc,newdata=data.frame(hormon=0),type="hr",var="hormon")



