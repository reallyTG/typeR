library(Publish)


### Name: publish.coxph
### Title: Tabulize hazard ratios with confidence intervals and p-values.
### Aliases: publish.coxph

### ** Examples

library(survival)
data(pbc)
pbc$edema <- factor(pbc$edema,
             levels=c("0","0.5","1"), labels=c("0","0.5","1"))
fit = coxph(Surv(time,status!=0)~age+sex+edema+log(bili)+log(albumin),
            data=na.omit(pbc))
publish(fit)
## forest plot
plot(publish(fit),cex=1.3)

publish(fit,ci.digits=2,pvalue.eps=0.01,pvalue.digits=2,pvalue.stars=TRUE)
publish(fit,ci.digits=2,ci.handler="prettyNum",pvalue.eps=0.01,
        pvalue.digits=2,pvalue.stars=TRUE)
publish(fit, ci.digits=2, ci.handler="sprintf", pvalue.eps=0.01,
        pvalue.digits=2,pvalue.stars=TRUE, ci.trim=FALSE)

fit2 = coxph(Surv(time,status!=0)~age+sex+edema+log(bili,base=2)+log(albumin)+log(protime),
    data=na.omit(pbc))
publish(fit2)

# with cluster variable
fit3 = coxph(Surv(time,status!=0)~age+cluster(sex)+edema+log(bili,base=2)
                                    +log(albumin)+log(protime),
    data=na.omit(pbc))
publish(fit3)

# with strata and cluster variable
fit4 = coxph(Surv(time,status!=0)~age+cluster(sex)+strata(edema)+log(bili,base=2)
                 +log(albumin)+log(protime),
    data=pbc)
publish(fit4)




