## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
x = seq(1,10)
y = log(x)

xarray = seq(1,10,0.01)

BaseSpline = splinefun(x,y, method = "monoH.FC")
Base0 = BaseSpline(xarray)
DerivBaseSpline = splinefun(xarray, numDeriv::grad(BaseSpline, xarray))
Base1 = DerivBaseSpline(xarray)
Deriv2BaseSpline = splinefun(xarray, numDeriv::grad(DerivBaseSpline, xarray))
Base2 = Deriv2BaseSpline(xarray)

plot(xarray, Base0, type = "l", col = 4, ylim = c(-1,3), main = "Base Spline and first two derivatives", ylab = "Spline and derivatives", xlab = "x")
lines(xarray, Base1, col = 2)
lines(xarray, Base2, col = 3)
abline(h = 0, col = 1)
text(x=rep(8,8,8), y=c(2, 0.5,-0.2), pos=4, labels=c('Spline', 'First Derivative', 'Second Derivative'))

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
library(schumaker)
SchumSpline = schumaker::Schumaker(x,y)
Schum0 = SchumSpline$Spline(xarray)
Schum1 = SchumSpline$DerivativeSpline(xarray)
Schum2 = SchumSpline$SecondDerivativeSpline(xarray)

plot(xarray, Schum0, type = "l", col = 4, ylim = c(-1,3), main = "Schumaker Spline and first two derivatives", ylab = "Spline and derivatives", xlab = "x")
lines(xarray, Schum1, col = 2)
lines(xarray, Schum2, col = 3)
abline(h = 0, col = 1)
text(x=rep(8,8,8), y=c(2, 0.5,-0.2), pos=4, labels=c('Spline', 'First Derivative', 'Second Derivative'))

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
x = seq(1,10)
y = log(x)
xarray = seq(-5,15,0.01)

SchumSplineCurve    = Schumaker(x,y, Extrapolation = "Curve"   )$Spline

SchumSplineConstant = Schumaker(x,y, Extrapolation = "Constant")$Spline

SchumSplineLinear   = Schumaker(x,y, Extrapolation = "Linear"  )$Spline

SchumSplineCurveVals    = SchumSplineCurve(xarray)
SchumSplineConstantVals = SchumSplineConstant(xarray)
SchumSplineLinearVals   = SchumSplineLinear(xarray)

plot(xarray, SchumSplineCurveVals, type = "l", col = 1, ylim = c(-5,5),
     main = "Ways of predicting outside of sample", ylab = "Spline value", xlab = "x")
lines(xarray, SchumSplineConstantVals, col = 2)
lines(xarray, SchumSplineLinearVals, col = 3)

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
x = c(-3,-1,-0.5,0)
y = c(0, 0.007, 2, 5)

sp_all = Schumaker(x,y)
sp = sp_all$Spline
sp1 = sp_all$DerivativeSpline
sp2 = sp_all$SecondDerivativeSpline

xarray = seq(min(x), max(x), length.out = 500)
yarray0 = sp(xarray)
plot(x,y, col = 1)
lines(xarray,yarray0, col = 2)
yarray1 = sp1(xarray)
lines(xarray,yarray1, col = 3)
yarray2 = sp2(xarray)
lines(xarray,yarray2, col = 4)

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
x = c(-3,-1,-0.5,0)
y = c(0, 0.007, 2, 5)

sp_all = Schumaker(x,y, edgeGradients = c(0,NA))
sp = sp_all$Spline
sp1 = sp_all$DerivativeSpline
sp2 = sp_all$SecondDerivativeSpline

xarray = seq(min(x), max(x), length.out = 500)
yarray0 = sp(xarray)
plot(x,y, col = 1)
lines(xarray,yarray0, col = 2)
yarray1 = sp1(xarray)
lines(xarray,yarray1, col = 3)
yarray2 = sp2(xarray)
lines(xarray,yarray2, col = 4)

## ---- fig.show='hold', fig.width=7, fig.height=4.5-----------------------
library(cobs)
#library(scam)

x = seq(1,10)
y = log(x)
dat = data.frame(x = x, y = y)
xarray = seq(0,15,0.01)

ScamSpline = function(dat) {scam::scam(y~s(x,k=4,bs="mdcx",m=1),data=dat)}
CobsSpline = function(x,y) {cobs::cobs(x , y, constraint = c("decrease", "convex"), print.mesg = FALSE)}

CreateSplineTest = rbenchmark::benchmark(
  replicate(10, Schumaker(x,y)),
  replicate(10,splinefun(x,y,"monoH.FC")),
  replicate(10,ScamSpline(dat)),
  replicate(10,CobsSpline(x,y)),
  columns = c('test','elapsed', 'relative')
)
print(CreateSplineTest)

BaseSp =   splinefun(x,y,"monoH.FC")
SchuSp =   Schumaker(x,y)$Spline
ScamSp =   scam::scam(y~s(x,k=4,bs="mdcx",m=1),data=dat)
CobsSp =   cobs::cobs(x , y, constraint = c("decrease", "convex"), print.mesg = FALSE)

ScamPr = function(x){  scam::predict.scam(ScamSp,data.frame(x = x))}
CobsPr = function(x){  predict(CobsSp, x)[,2] }

PredictArrayTest = rbenchmark::benchmark(
  replicate(10,SchuSp(xarray)),
  replicate(10,BaseSp(xarray)),
  replicate(10,ScamPr(xarray)),
  replicate(10,CobsPr(xarray)),
  columns = c('test','elapsed', 'relative')
)
print(PredictArrayTest)


SchuSp =   Schumaker(x,y, Vectorise = FALSE)$Spline
PredictPointTest = rbenchmark::benchmark(
  replicate(100,SchuSp(runif(1))),
  replicate(100,BaseSp(runif(1))),
  replicate(100,ScamPr(runif(1))),
  replicate(100,CobsPr(runif(1))),
  columns = c('test','elapsed', 'relative')
)
print(PredictPointTest)


