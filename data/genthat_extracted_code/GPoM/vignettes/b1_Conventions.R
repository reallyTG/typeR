## ------------------------------------------------------------------------
nVar = 3
dMax = 2
poLabs(nVar = nVar, dMax = dMax)

## ---- echo=FALSE---------------------------------------------------------
nVar = 3
dMax = 2

## ------------------------------------------------------------------------
pMax =  d2pMax(nVar, dMax)

## ------------------------------------------------------------------------
param <- c(1, 0, 0, 0, 0, 4, 2, -3, 0, 0)

## ------------------------------------------------------------------------
nVar = 3
dMax = 2
cbind(param, poLabs(nVar, dMax))

## ------------------------------------------------------------------------
poLabs(3, 2, Xnote = 'y')

## ------------------------------------------------------------------------
poLabs(3, 2, Xnote = c('x','W','y'))

## ------------------------------------------------------------------------
# parameters
a = 0.52
b = 2
c = 4
# equations
Eq1 <- c(0,-1, 0,-1, 0, 0, 0, 0, 0, 0)
Eq2 <- c(0, 0, 0, a, 0, 0, 1, 0, 0, 0)
Eq3 <- c(b,-c, 0, 0, 0, 0, 0, 1, 0, 0)

## ------------------------------------------------------------------------
K = cbind(Eq1, Eq2, Eq3)

## ------------------------------------------------------------------------
visuEq(nVar, dMax, K)

## ------------------------------------------------------------------------
visuEq(nVar, dMax, K, substit = 1)

## ---- eval=TRUE----------------------------------------------------------
visuEq(nVar, dMax, K, substit = c("U", "V", "W"))

## ------------------------------------------------------------------------
# The initial conditions of the system variables
v0 <- c(-0.6, 0.6, 0.4)
# the model formulation K (see former section)
# the number of integration steps `Istep`
nIstep <- 5000
# the time step length `onestep`
onestep = 1/50
# the model dimension `nVar`
nVar = 3
# the maximum polynomial degree `dMax`
dMax = 2

## ------------------------------------------------------------------------
outNumi <- numicano(nVar, dMax, Istep = nIstep, onestep = onestep, KL = K, v0 = v0)

## ---- eval=FALSE---------------------------------------------------------
#  outNumi$KL

## ---- eval = FALSE-------------------------------------------------------
#  # nVar
#  dim(outNumi$K)[2]
#  # dMax
#  pMax <- dim(outNumi$K)[1]
#  p2dMax(nVar, pMaxKnown = pMax)

## ---- eval=FALSE---------------------------------------------------------
#  # initial conditions
#  head(outNumi$reconstr, 1)[2:(nVar+1)]
#  # time step
#  diff(outNumi$reconstr[1:2,1])
#  # number of integration time step
#  dim(outNumi$reconstr)[1]

## ---- fig.show='hold', fig.align='center'--------------------------------
plot(outNumi$reconstr[,1], outNumi$reconstr[,2], type='l',
     main='time series', xlab='t', ylab = 'x(t)')

## ---- fig.show='hold', fig.align='center', fig.width=4, fig.height=4-----
plot(outNumi$reconstr[,2], outNumi$reconstr[,3], type='l',
     main='phase portrait', xlab='x(t)', ylab = 'y(t)')

