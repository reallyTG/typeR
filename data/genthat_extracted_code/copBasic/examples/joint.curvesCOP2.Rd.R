library(copBasic)


### Name: joint.curvesCOP2
### Title: Compute Coordinates of the Marginal Probabilities given joint
###   AND or OR Probability
### Aliases: joint.curvesCOP2
### Keywords: joint probability

### ** Examples

## Not run: 
##D # Approach the joint curves from both "with respect two" perspectives---results same.
##D JCvwrtu <- joint.curvesCOP( cop=PSP, prob=0.98)$"0.98"
##D JCuwrtv <- joint.curvesCOP2(cop=PSP, prob=0.98)$"0.98"; lim <- c(2,5)
##D plot(qnorm(JCvwrtu$U), qnorm(JCvwrtu$V), type="l", lwd=6, col=8, xlim=lim, ylim=lim,
##D      xlab="STANDARD NORMAL VARIATE IN U", ylab="STANDARD NORMAL VARIATE IN V")
##D lines(qnorm(JCuwrtv$U), qnorm(JCuwrtv$V), col=2, lwd=2)
##D mtext("98th Joint Percentile Level Curve for PSP Copula")#
## End(Not run)



