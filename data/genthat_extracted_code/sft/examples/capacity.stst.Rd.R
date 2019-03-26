library(sft)


### Name: capacity.stst
### Title: Capacity Coefficient for Single-Target Self-Terminating (STST)
###   Processing
### Aliases: capacity.stst
### Keywords: sft

### ** Examples

rate1 <- .35
RT.pa <- rexp(100, rate1)
RT.pp.limited <- rexp(100, .5*rate1)
RT.pp.unlimited <- rexp(100, rate1)
RT.pp.super <- rexp(100, 2*rate1)
tvec <- sort(unique(c(RT.pa, RT.pp.limited, RT.pp.unlimited, RT.pp.super)))

cap.limited <- capacity.stst(RT=list(RT.pp.limited, RT.pa))
print(cap.limited$Ctest)
cap.unlimited <- capacity.stst(RT=list(RT.pp.unlimited, RT.pa))
cap.super <- capacity.stst(RT=list(RT.pp.super, RT.pa))

matplot(tvec, cbind(cap.limited$Ct(tvec), cap.unlimited$Ct(tvec), cap.super$Ct(tvec)),
  type='l', lty=1, ylim=c(0,5), col=2:4, main="Example Capacity Functions", xlab="Time", 
  ylab="C(t)")
abline(1,0)
legend('topright', c("Limited", "Unlimited", "Super"), lty=1, col=2:4, bty="n")




