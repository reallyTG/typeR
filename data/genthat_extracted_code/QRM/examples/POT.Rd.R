library(QRM)


### Name: POT
### Title: Peaks-over-Threshold Method
### Aliases: POT fit.GPD findthreshold plotTail MEplot showRM xiplot
###   RiskMeasures hill hillPlot plotFittedGPDvsEmpiricalExcesses
### Keywords: distributions

### ** Examples

data(danish)
plot(danish)

MEplot(danish)

xiplot(danish)

hillPlot(danish, option = "alpha", start = 5, end = 250, p = 0.99)
hillPlot(danish, option = "alpha", start = 5, end = 60, p = 0.99)

plotFittedGPDvsEmpiricalExcesses(danish, nextremes = 109)
u <- quantile(danish, probs=0.9, names=FALSE)
plotFittedGPDvsEmpiricalExcesses(danish, threshold = u)

findthreshold(danish, 50)
mod1 <- fit.GPD(danish, threshold = u)

RiskMeasures(mod1, c(0.95, 0.99))
plotTail(mod1)

showRM(mod1, alpha = 0.99, RM = "VaR", method = "BFGS")
showRM(mod1, alpha = 0.99, RM = "ES", method = "BFGS")

mod2 <- fit.GPD(danish, threshold = u, type = "pwm")
mod3 <- fit.GPD(danish, threshold = u, optfunc = "nlminb")

## Hill plot manually constructed based on hill()

## generate data
set.seed(1)
n <- 1000 # sample size
U <- runif(n)
X1 <- 1/(1-U) # ~ F_1(x) = 1-x^{-1}, x >= 1 => Par(1)
F2 <- function(x) 1-(x*log(x))^(-1) # Par(1) with distorted SV function
X2 <- vapply(U, function(u) uniroot(function(x) 1-(x*log(x))^(-1)-u,
                                    lower=1.75, upper=1e10)$root, NA_real_)

## compute Hill estimators for various k
k <- 10:800
y1 <- hill(X1, k=k)
y2 <- hill(X2, k=k)

## Hill plot
plot(k, y1, type="l", ylim=range(y1, y2, 1),
     xlab=expression("Number"~~italic(k)~~"of upper order statistics"),
     ylab=expression("Hill estimator for"~~alpha),
     main="Hill plot") # Hill plot, good natured case (based on X1)
lines(k, y2, col="firebrick") # Hill "horror" plot (based on X2)
lines(x=c(10, 800), y=c(1, 1), col="royalblue3") # correct value alpha=1
legend("topleft", inset=0.01, lty=c(1, 1, 1), bty="n",
       col=c("black", "firebrick", "royalblue3"),
       legend=as.expression(c("Hill estimator based on"~~
                               italic(F)(x)==1-1/x,
                              "Hill estimator based on"~~
                               italic(F)(x)==1-1/(x~log~x),
                              "Correct value"~~alpha==1)))

## via hillPlot()
hillPlot(X1, option="alpha", start=10, end=800)
hillPlot(X2, option="alpha", start=10, end=800)



