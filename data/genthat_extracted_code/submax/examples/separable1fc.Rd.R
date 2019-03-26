library(submax)


### Name: separable1fc
### Title: Computes the Separable Approximation.
### Aliases: separable1fc
### Keywords: htest robust

### ** Examples

# The following artificial example computes mscores for a
# full matching, then applies separable1fc() to
# perform a sensitivity analysis.  Compare with
# the example below from the sensitivityfull package.

# The artificial example that follows has I=9
# matched sets.  The first 3 sets have one treated
# individual and two controls with treated subjects
# in column 1.  The next 3 sets are
# matched pairs, with treated subjects in column 1.
# The next 3 sets have one control and two treated
# subjects, with the control in column 1.  Simulated
# from a Normal distribution with an additive effect
# of tau=1.

y<-c(2.2, 1.4, 1.6, 2.4, 0.7, 1.3, 1.2, 0.6, 0.3,
0.5, -0.1, -1.3, -0.3, 0.1, 0.4, 3.0, 1.1, 1.4, -0.8,
0.1, 0.8, NA, NA, NA, 1.1, 0.5, 1.8)
y<-matrix(y,9,3)
treated1<-c(rep(TRUE,6),rep(FALSE,3))

s<-separable1fc(sensitivityfull::mscoref(y,treated1),gamma=2)
1-pnorm((sum(s$tstat)-sum(s$expect))/sqrt(sum(s$vari)))
sensitivityfull::senfm(y,treated1,gamma=2)
s



