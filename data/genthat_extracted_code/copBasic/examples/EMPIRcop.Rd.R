library(copBasic)


### Name: EMPIRcop
### Title: The Bivariate Empirical Copula
### Aliases: EMPIRcop
### Keywords: empirical copula copula (empirical) copula

### ** Examples

## Not run: 
##D EMPIRcop(0.321,0.78, para=simCOP(n=90, cop=N4212cop, para=2.32, graphics=FALSE))
##D N4212cop(0.321,0.78, para=2.32)#
## End(Not run)

## Not run: 
##D set.seed(62) # See note below about another seed to try.
##D psp <- simCOP(n=34, cop=PSP, ploton=FALSE, points=FALSE) * 150
##D # Pretend psp is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls. Although the Weibull
##D # plotting positions are chosen, internally EMPIRcop uses ranks, but the model
##D # here is to imagine one having a sample in native units of the random variables
##D # and then casting them into probabilities for other purposes.
##D fakeU <- lmomco::pp(psp[,1], sort=FALSE) # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(psp[,2], sort=FALSE) # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV); # our U-statistics
##D 
##D # The next four values should be very close if n above were say 1000, but the
##D # ctype="bernstein"" should not be used if n >> 34 because of inherently long runtime.
##D PSP(0.4,0.6)              # 0.3157895 (compare to listed values below)
##D 
##D # Two seeds are shown so that the user can see that depending on the distribution
##D # of the values given by para that different coincidences of which method is
##D # equivalent to another exist.
##D # For set.seed(62) --- "hazen" == "weibull" by coincidence
##D #    "hazen"     --> 0.3529412
##D #    "weibull"   --> 0.3529412
##D #    "1/n"       --> 0.3235294
##D #    "bernstein" --> 0.3228916
##D # For set.seed(85) --- "1/n" == "hazen" by coincidence
##D #    "hazen"     --> 0.3529412
##D #    "weibull"   --> 0.3823529
##D #    "1/n"       --> 0.3529412
##D #    "bernstein" --> 0.3440387
##D 
##D # For set.seed(62) --- not all measures of association can be used for all
##D # empirical copulas because of 'divergent' integral errors, but this is an example
##D # for Hoeffding's Phi.
##D hoefCOP(as.sample=TRUE, para=uv) #  (sample estimator is fast)  # 0.4987755
##D hoefCOP(cop=EMPIRcop,   para=uv, ctype="hazen")                 # 0.5035348
##D hoefCOP(cop=EMPIRcop,   para=uv, ctype="weibull")               # 0.4977145
##D hoefCOP(cop=EMPIRcop,   para=uv, ctype="1/n")                   # 0.4003646
##D hoefCOP(cop=EMPIRcop,   para=uv, ctype="bernstein")             # 0.4563724
## End(Not run)

# All other example suites shown below are dependent on the pseudo-data in the
# variable uv. It is suggested to not run with a sample size much larger than the
# above n=34 if the Bernstein comparison is intended (wanted) simply because of
# lengthy(!) run times, but the n=34 does provide a solid demonstration how the
# level curves for berstein weights are quite smooth.

## Not run: 
##D # TODO: Now let us construct as many as three sets of level curves
##D level.curvesCOP(cop=PSP); # TRUE, parametric, fast, BLACK CURVES
##D 
##D # Empirical copulas can consume lots of CPU.
##D # RED CURVES, if n is too small, uniroot() errors might be triggered and likely
##D # will be using the sample size of 34 shown above.
##D level.curvesCOP(cop=EMPIRcop, para=uv, delu=0.03, col=2, ploton=FALSE)
##D 
##D # GREEN CURVES (large CPU committment)
##D # Bernstein progress is uninformative because level.curvesCOP() has taken over control.
##D bpara <- list(para=uv, ctype="bernstein", bernprogress=FALSE)
##D level.curvesCOP(cop=EMPIRcop, para=bpara, delu=0.03, col=3, ploton=FALSE)
##D # The delu is increased for faster execution but more important,
##D # notice the greater smoothness of the Bernstein refinement.
## End(Not run)

## Not run: 
##D # Experimental from R Graphics by Murrell (2005, p.112)
##D "trans3d" <-
##D function(x,y,z, pmat) tmat <- cbind(x,y,z,1) %*% pmat; return(tmat[,1:2] / tmat[,4])
##D 
##D the.grid <- EMPIRgrid(para=uv)
##D the.diag <- diagCOP(cop=EMPIRcop, para=uv, ploton=FALSE, lines=FALSE)
##D 
##D the.persp <- persp(the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D the.trace <- trans3d(the.diag$t, the.diag$t, the.diag$diagcop, the.persp)
##D lines(the.trace, lwd=2, col=2) # The diagonal of the copula
##D 
##D # The following could have been used as an alternative to call persp()
##D the.persp <- persp(x=the.grid$u, y=the.grid$v, z=the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")#
## End(Not run)



