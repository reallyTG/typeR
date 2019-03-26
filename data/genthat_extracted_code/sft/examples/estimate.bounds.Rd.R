library(sft)


### Name: estimate.bounds
### Title: Bounds on Response Time Cumulative Distribution Functions for
###   Parallel Processing Models
### Aliases: estimate.bounds
### Keywords: sft

### ** Examples

#randomly generated data
rate1 <- .35
rate2 <- .3
rate3 <- .4
RT.paa <- rexp(100, rate1)
RT.apa <- rexp(100, rate2)
RT.aap <- rexp(100, rate3)
RT.or <- pmin(rexp(100, rate1), rexp(100, rate2), rexp(100, rate3))
RT.and <- pmax(rexp(100, rate1), rexp(100, rate2), rexp(100, rate3))
tvec <- sort(unique(c(RT.paa, RT.apa, RT.aap, RT.or, RT.and)))

or.bounds <- estimate.bounds(RT=list(RT.paa, RT.apa, RT.aap), CR=NULL, assume.ID=FALSE, 
  unified.space=FALSE)
and.bounds <- estimate.bounds(RT=list(RT.paa, RT.apa, RT.aap))

## Not run: 
##D #plot the or bounds together with a parallel OR model
##D matplot(tvec, 
##D   cbind(or.bounds$Upper.Bound(tvec), or.bounds$Lower.Bound(tvec), ecdf(RT.or)(tvec)),
##D   type='l', lty=1, ylim=c(0,1), col=2:4, main="Example OR Bounds", xlab="Time", 
##D   ylab="P(T<t)")
##D abline(1,0)
##D legend('topright', c("Upper Bound", "Lower Bound", "Parallel OR Model"), 
##D   lty=1, col=2:4, bty="n")
##D 
##D #using the dots data set in sft package
##D data(dots)
##D attach(dots)
##D RT.A <- dots[Subject=='S1' & Condition=='OR' & Channel1==2 & Channel2==0, 'RT']
##D RT.B <- dots[Subject=='S1' & Condition=='OR' & Channel1==0 & Channel2==2, 'RT']
##D RT.AB <- dots[Subject=='S1' & Condition=='OR' & Channel1==2 & Channel2==2, 'RT']
##D tvec <- sort(unique(c(RT.A, RT.B, RT.AB)))
##D Cor.A <- dots[Subject=='S1' & Condition=='OR' & Channel1==2 & Channel2==0, 'Correct']
##D Cor.B <- dots[Subject=='S1' & Condition=='OR' & Channel1==0 & Channel2==2, 'Correct']
##D Cor.AB <- dots[Subject=='S1' & Condition=='OR' & Channel1==2 & Channel2==2, 'Correct']
##D capacity <- capacity.or(list(RT.AB,RT.A,RT.B), list(Cor.AB,Cor.A,Cor.B), ratio=TRUE)
##D bounds <- estimate.bounds(list(RT.A,RT.B), list(Cor.A,Cor.B), unified.space=TRUE)
##D 
##D #plot unified capacity coefficient space
##D plot(tvec, capacity$Ct(tvec), type="l", lty=1, col="red", lwd=2)
##D lines(tvec, bounds$Upper.Bound(tvec), lty=2, col="blue", lwd=2)
##D lines(tvec, bounds$Lower.Bound(tvec), lty=4, col="blue", lwd=2)
##D abline(h=1, col="black", lty=1)
## End(Not run)



