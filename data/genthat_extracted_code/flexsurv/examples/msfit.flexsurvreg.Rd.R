library(flexsurv)


### Name: msfit.flexsurvreg
### Title: Cumulative intensity function for parametric multi-state models
### Aliases: msfit.flexsurvreg
### Keywords: models

### ** Examples


## 3 state illness-death model for bronchiolitis obliterans
## Compare clock-reset / semi-Markov multi-state models

## Simple exponential model (reduces to Markov)

bexp <- flexsurvreg(Surv(years, status) ~ trans,
                    data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))
mexp <- msfit.flexsurvreg(bexp, t=seq(0,12,by=0.1),
                          trans=tmat, tvar="trans", variance=FALSE)

## Cox semi-parametric model within each transition

bcox <- coxph(Surv(years, status) ~ strata(trans), data=bosms3)

if (require("mstate")){

mcox <- mstate::msfit(bcox, trans=tmat)

## Flexible parametric spline-based model 

bspl <- flexsurvspline(Surv(years, status) ~ trans + gamma1(trans),
                       data=bosms3, k=3)
mspl <- msfit.flexsurvreg(bspl, t=seq(0,12,by=0.1),
                         trans=tmat, tvar="trans", variance=FALSE)

## Compare fit: exponential model is OK but the spline is better

plot(mcox, lwd=1, xlim=c(0, 12), ylim=c(0,4))
cols <- c("black","red","green")
for (i in 1:3){
    lines(mexp$Haz$time[mexp$Haz$trans==i], mexp$Haz$Haz[mexp$Haz$trans==i],
             col=cols[i], lwd=2, lty=2)
    lines(mspl$Haz$time[mspl$Haz$trans==i], mspl$Haz$Haz[mspl$Haz$trans==i],
             col=cols[i], lwd=3)
}
legend("topright", lwd=c(1,2,3), lty=c(1,2,1),
   c("Cox", "Exponential", "Flexible parametric"), bty="n")

}

## Fit a list of models, one for each transition
## More computationally efficient, but only valid if parameters
## are different between transitions.

## Not run: 
##D bexp.list <- vector(3, mode="list")
##D for (i in 1:3) { 
##D   bexp.list[[i]] <- flexsurvreg(Surv(years, status) ~ 1, subset=(trans==i),
##D                                 data=bosms3, dist="exp")
##D }
##D 
##D ## The list of models can be passed to this and other functions,
##D ## as if it were a single multi-state model. 
##D 
##D msfit.flexsurvreg(bexp.list, t=seq(0,12,by=0.1), trans=tmat)
## End(Not run)




