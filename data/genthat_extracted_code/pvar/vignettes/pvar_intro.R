## ----setup, echo=FALSE, cache=FALSE--------------------------------------
library("pvar")

## ----pvar_basic----------------------------------------------------------
N <- 1000
p <- 2
x <- rwiener(N)
pv <- pvar(x, p)
pv
summary(pv)

## ----pvar_plot-----------------------------------------------------------
plot(pv)

## ----pvar_partition------------------------------------------------------
pv.PP = pvar(x[pv$partition], TimeLabel=time(x)[pv$partition], 2)
plot(pv.PP, main='The same pvar without redundant points')

## ----pvar_add------------------------------------------------------------
x = rwiener(1000)
pv1 = pvar(x[1:500], 2)
pv2 = pvar(x[500:length(x)], 2)
sum_pv1_pv2 = pv1 + pv2

## ----pvar_add_picture, echo=FALSE----------------------------------------
layout(matrix(c(1,3,2,3), 2, 2))
# par(mar=c(4,4,2,1))
plot(pv1, main="pv1")
plot(pv2, main="pv2")
plot(sum_pv1_pv2, main="p-variation of pv1+pv2")
layout(1)

## ----test_data, echo=TRUE------------------------------------------------
set.seed(1)
MiuDiff <- 0.3
x <- rnorm(250*4, rep(c(0, MiuDiff, 0, MiuDiff), each=250))

## ----test_plotdata, echo=FALSE-------------------------------------------
plot(x, pch=19, cex=0.5, main="Original data, with several shifts in mean")
k <- 50
moveAvg <- filter(x, rep(1/k, k))
lines(time(x), moveAvg, lwd=2, col=2)
legend("topleft", c("sample", "moving average (k="%.%k%.%")"),
  lty=c(NA,1), lwd=c(NA, 2), col=1:2, pch=c(19,NA), pt.cex=c(0.7,1)
  ,inset = .03, bg="antiquewhite1")  

## ----test_result, echo=TRUE----------------------------------------------
xtest <- PvarBreakTest(x)
xtest

## ----test_plot, echo=FALSE-----------------------------------------------
plot(xtest)

