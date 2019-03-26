library(OpenMx)


### Name: mxExpectationStateSpaceContinuousTime
### Title: Create an MxExpectationStateSpace Object
### Aliases: mxExpectationStateSpaceContinuousTime mxExpectationSSCT

### ** Examples

#------------------------------------------------------------------------------
# Example 1
# Undamped linear oscillator, i.e. a noisy sine wave.
#	Measurement error, but no dynamic error, single indicator.
#	This example works great.

#--------------------------------------
# Data Generation

require(OpenMx)

set.seed(405)
tlen <- 200
t <- seq(1.2, 50, length.out=tlen)

freqParam <- .5
initialCond <- matrix(c(2.5, 0))
x <- initialCond[1,1]*cos(freqParam*t)
plot(t, x, type='l')

measVar <- 1.5
y <- cbind(obs=x+rnorm(tlen, sd=sqrt(measVar)), tim=t)

plot(t, y[,1], type='l')

#--------------------------------------
# Model Specification

#Note: the bounds are here only to keep SLSQP from
# stepping too far off a cliff.  With the bounds in
# place, SLSQP finds the right solution.  Without
# the bounds, SLSQP goes crazy.


cdim <- list('obs', c('ksi', 'ksiDot'))

amat <- mxMatrix('Full', 2, 2, c(FALSE, TRUE, FALSE, TRUE), c(0, -.1, 1, -.2),
	name='A', lbound=-10)
bmat <- mxMatrix('Zero', 2, 1, name='B')
cmat <- mxMatrix('Full', 1, 2, FALSE, c(1, 0), name='C', dimnames=cdim)
dmat <- mxMatrix('Zero', 1, 1, name='D')
qmat <- mxMatrix('Zero', 2, 2, name='Q')
rmat <- mxMatrix('Diag', 1, 1, TRUE, .4, name='R', lbound=1e-6)
xmat <- mxMatrix('Full', 2, 1, TRUE, c(0, 0), name='x0', lbound=-10, ubound=10)
pmat <- mxMatrix('Diag', 2, 2, FALSE, 1, name='P0')
umat <- mxMatrix('Zero', 1, 1, name='u')
tmat <- mxMatrix('Full', 1, 1, name='time', labels='data.tim')

osc <- mxModel("LinearOscillator", 
	amat, bmat, cmat, dmat, qmat, rmat, xmat, pmat, umat, tmat,
	mxExpectationSSCT('A', 'B', 'C', 'D', 'Q', 'R', 'x0', 'P0', 'u', 'time'),
	mxFitFunctionML(),
	mxData(y, 'raw'))


oscr <- mxRun(osc)


#--------------------------------------
# Results Examination

summary(oscr)


(ssFreqParam <- mxEval(sqrt(-A[2,1]), oscr))
freqParam


(ssMeasVar <- mxEval(R, oscr))
measVar


dampingParam <- 0
(ssDampingParam <- mxEval(-A[2,2], oscr))
dampingParam




