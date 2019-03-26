library(monomvn)


### Name: default.QP
### Title: Generating a default Quadratic Program for bmonomvn
### Aliases: default.QP
### Keywords: optimize

### ** Examples

## generate N=100 samples from a 10-d random MVN
## and randomly impose monotone missingness
xmuS <- randmvn(100, 20)
xmiss <- rmono(xmuS$x)

## set up the minimum-variance (default) Quadratic Program
## and sample from the posterior of the solution space
qp1 <- default.QP(ncol(xmiss))
obl1 <- bmonomvn(xmiss, QP=qp1)
bm1 <- monomvn.solve.QP(obl1$S, qp1) ## calculate mean
bm1er <- monomvn.solve.QP(obl1$S + obl1$mu.cov, qp1) ## use estimation risk
oml1 <- monomvn(xmiss)
mm1 <- monomvn.solve.QP(oml1$S, qp1) ## calculate MLE

## now obtain samples from the solution space of the
## mean-variance QP
qp2 <- default.QP(ncol(xmiss), dmu=TRUE)
obl2 <- bmonomvn(xmiss, QP=qp2)
bm2 <- monomvn.solve.QP(obl2$S, qp2, obl2$mu) ## calculate mean
bm2er <- monomvn.solve.QP(obl2$S + obl2$mu.cov, qp2, obl2$mu) ## use estimation risk
oml2 <- monomvn(xmiss)
mm2 <- monomvn.solve.QP(oml2$S, qp2, oml2$mu) ## calculate MLE

## now obtain samples from minimum variance solutions
## where the mean weighted (samples) are constrained to be
## greater one
qp3 <- default.QP(ncol(xmiss), mu.constr=1)
obl3 <- bmonomvn(xmiss, QP=qp3)
bm3 <- monomvn.solve.QP(obl3$S, qp3, obl3$mu) ## calculate mean
bm3er <- monomvn.solve.QP(obl3$S + obl3$mu.cov, qp3, obl3$mu) ## use estimation risk
oml3 <- monomvn(xmiss)
mm3 <- monomvn.solve.QP(oml3$S, qp3, oml2$mu) ## calculate MLE

## plot a comparison
par(mfrow=c(3,1))
plot(obl1, which="QP", xaxis="index", main="Minimum Variance")
points(bm1er, col=4, pch=17, cex=1.5) ## add estimation risk
points(bm1, col=3, pch=18, cex=1.5) ## add mean
points(mm1, col=5, pch=16, cex=1.5) ## add MLE
legend("topleft", c("MAP", "posterior mean", "ER", "MLE"), col=2:5,
       pch=c(21,18,17,16), cex=1.5)
plot(obl2, which="QP", xaxis="index", main="Mean Variance")
points(bm2er, col=4, pch=17, cex=1.5) ## add estimation risk
points(bm2, col=3, pch=18, cex=1.5) ## add mean
points(mm2, col=5, pch=16, cex=1.5) ## add MLE
plot(obl3, which="QP", xaxis="index", main="Minimum Variance, mean >= 1")
points(bm3er, col=4, pch=17, cex=1.5) ## add estimation risk
points(bm3, col=3, pch=18, cex=1.5) ## add mean
points(mm3, col=5, pch=16, cex=1.5) ## add MLE

## for a further comparison of samples of the QP solution
## w under Bayesian and non-Bayesian monomvn, see the
## examples in the bmonomvn help file



