library(refund)


### Name: pfr
### Title: Penalized Functional Regression
### Aliases: pfr

### ** Examples

# See lf(), lf.vd(), af(), fpc(), and peer() for additional examples

data(DTI)
DTI1 <- DTI[DTI$visit==1 & complete.cases(DTI),]
par(mfrow=c(1,2))

# Fit model with linear functional term for CCA
fit.lf <- pfr(pasat ~ lf(cca, k=30, bs="ps"), data=DTI1)
plot(fit.lf, ylab=expression(paste(beta(t))), xlab="t")
## Not run: 
##D # Alternative way to plot
##D bhat.lf <- coef(fit.lf, n=101)
##D bhat.lf$upper <- bhat.lf$value + 1.96*bhat.lf$se
##D bhat.lf$lower <- bhat.lf$value - 1.96*bhat.lf$se
##D matplot(bhat.lf$cca.argvals, bhat.lf[,c("value", "upper", "lower")],
##D         type="l", lty=c(1,2,2), col=1,
##D         ylab=expression(paste(beta(t))), xlab="t")
##D 
##D # Fit model with additive functional term for CCA, using tensor product basis
##D fit.af <- pfr(pasat ~ af(cca, Qtransform=TRUE, k=c(7,7)), data=DTI1)
##D plot(fit.af, scheme=2, xlab="t", ylab="cca(t)", main="Tensor Product")
##D plot(fit.af, scheme=2, Qtransform=TRUE,
##D      xlab="t", ylab="cca(t)", main="Tensor Product")
##D 
##D # Change basistype to thin-plate regression splines
##D fit.af.s <- pfr(pasat ~ af(cca, basistype="s", Qtransform=TRUE, k=50),
##D                 data=DTI1)
##D plot(fit.af.s, scheme=2, xlab="t", ylab="cca(t)", main="TPRS", rug=FALSE)
##D plot(fit.af.s, scheme=2, Qtransform=TRUE,
##D      xlab="t", ylab="cca(t)", main="TPRS", rug=FALSE)
##D 
##D # Visualize bivariate function at various values of x
##D par(mfrow=c(2,2))
##D vis.pfr(fit.af, xval=.2)
##D vis.pfr(fit.af, xval=.4)
##D vis.pfr(fit.af, xval=.6)
##D vis.pfr(fit.af, xval=.8)
##D 
##D # Include random intercept for subject
##D DTI.re <- DTI[complete.cases(DTI$cca),]
##D DTI.re$ID <- factor(DTI.re$ID)
##D fit.re <- pfr(pasat ~ lf(cca, k=30) + re(ID), data=DTI.re)
##D coef.re <- coef(fit.re)
##D par(mfrow=c(1,2))
##D plot(fit.re)
##D 
##D # FPCR_R Model
##D fit.fpc <- pfr(pasat ~ fpc(cca), data=DTI.re)
##D plot(fit.fpc)
##D 
##D # PEER Model with second order difference penalty
##D DTI.use <- DTI[DTI$case==1,]
##D DTI.use <- DTI.use[complete.cases(DTI.use$cca),]
##D fit.peer <- pfr(pasat ~ peer(cca, argvals=seq(0,1,length=93),
##D                              integration="riemann", pentype="D"), data=DTI.use)
##D plot(fit.peer)
## End(Not run)



