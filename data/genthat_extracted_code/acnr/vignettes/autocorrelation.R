## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=FALSE------------------------------------------------------
library("acnr")
library("R.utils")

## ------------------------------------------------------------------------
dataSets <- listDataSets()
dataSet <- dataSets[2]
print(dataSet)

tfs <- listTumorFractions(dataSet)
tf <- tfs[1]
(tf)

dat <- loadCnRegionData(dataSet, tumorFraction=tf)
region <- as.factor(dat$region)

## ------------------------------------------------------------------------
x <- dat$c
rm(dat)

## ---- fig.width=4, fig.height=2, message=FALSE---------------------------
lim <- c(0, 0.05)
res <- sapply(levels(region), function (rr){
    xTrue <- x[which(region==rr)]
    xResamp <- sample(xTrue)
    mar <- c(2, 2, 1, 0)+0.2
    par(mar=mar)
    acf(xTrue, ylim=lim)
    mtext(sprintf("Original data: %s", rr), side=3)
    acf(xResamp, ylim=lim)
    mtext(sprintf("Resampled data: %s", rr), side=3)
})

## ---- results='asis'-----------------------------------------------------
tst <- "Ljung-Box"
lag <- 20
res <- sapply(levels(region), function (rr){
    xTrue <- x[which(region==rr)]
    len <- length(xTrue)
    xResamp <- sample(xTrue)
    bt <- Box.test(xTrue, lag=lag, type=tst)
    br <- Box.test(xResamp, lag=lag, type=tst)
    c("Original data"=bt$p.value, "Resampled data"=br$p.value, "Region size"=len)
})
cpt <- sprintf("$p$-values of the %s auto-correlation test (lag=%s)", tst, lag)
knitr::kable(t(res), caption=cpt)

## ------------------------------------------------------------------------
plot(sort(res[2, ]), ylab="p-value", xlab="rank", main="sorted p-values", pch=19, col=3, ylim=c(0,1))
points(sort(res[1, ]), pch=19, col=1)
abline(a=0, b=1/ncol(res), lty=2)

## ---- results='asis'-----------------------------------------------------
tst <- "Ljung-Box"
lag <- 20
maxSize <- 2000
res2 <- sapply(levels(region), function (rr){
    xTrue <- head(x[which(region==rr)], maxSize)
    len <- length(xTrue)
    xResamp <- sample(xTrue)
    bt <- Box.test(xTrue, lag=lag, type=tst)
    br <- Box.test(xResamp, lag=lag, type=tst)
    c("Original data"=bt$p.value, "Resampled data"=br$p.value, "Region size"=len)
})
cpt <- sprintf("$p$-values of the %s auto-correlation test (lag=%s) for regions of size <= %s", tst, lag, maxSize)
knitr::kable(t(res2), caption=cpt)

## ------------------------------------------------------------------------
plot(sort(res2[2, ]), ylab="p-value", xlab="rank", main="sorted p-values", pch=19, col=3, ylim=c(0,1))
points(sort(res2[1, ]), pch=19, col=1)
abline(a=0, b=1/ncol(res), lty=2)

## ------------------------------------------------------------------------
sessionInfo()

