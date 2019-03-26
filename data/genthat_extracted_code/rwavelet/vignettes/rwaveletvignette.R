## ---- echo=FALSE---------------------------------------------------------
#options(vignetteDocumentFormat=rmarkdown::all_output_formats("rwaveletvignette.Rmd"))

## ----Setup, include=FALSE------------------------------------------------
library(rwavelet)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=5,
  fig.height=5, 
  fig.align="center"
)
set.seed(0)
library(rwavelet)
par(mgp = c(2,0.5,0),
    mar = c(4,3,2,1),
    oma = c(1,1,0,0))

## ---- echo=TRUE----------------------------------------------------------
J <- 10; n <- 2^J; t <- (1:n) / n
name <- c('Bumps')
f <- MakeSignal(name, n)
plot(t, f, xlab="t", ylab="f(t)",
     type='l', lwd=1.2, main=name)

## ---- echo=TRUE----------------------------------------------------------
SNR <- 4
set.seed(1)
ssig <- sd(f)
sigma <- ssig / SNR
y <- f + rnorm(n, mean=0, sd=sigma)
plot(t, y, xlab="t", ylab="y", main=paste("Noisy", name))

## ---- echo=TRUE----------------------------------------------------------
qmf <- MakeONFilter('Daubechies', 10)
L <- 3
wc <- FWT_PO(y, L, qmf)
wcf <- FWT_PO(f, L, qmf)

## ---- echo=TRUE----------------------------------------------------------
PlotWaveCoeff(wc, L, 0.5)
title("Noisy Wavelet Coefs")
PlotWaveCoeff(wcf, L, 0.5)
title("Original Wavelet Coefs")

## ---- echo=TRUE----------------------------------------------------------
# estimate sigma using the maximum absolute deviation
# using only the fine scale of wc
hatsigma <- MAD(wc[(2^(J-1)+1):2^J])
thr <- sqrt(2*log(length(y)))*hatsigma
# apply hard thresholding 
wc[(2^(L)+1):n] <- HardThresh(wc[(2^(L)+1):n], thr)
# plot the resulting coeficients estimates
PlotWaveCoeff(wc, L, 0.5)
title("Estimated Wavelet Coefs")
fest <- IWT_PO(wc, L, qmf)
snrout <- SNR(f, fest)
plot(t, fest, type='l', lwd=1.4, col='red', xlab="t", ylab="hat_f(t)",
	   main=format(round(snrout,2), nsmall=2))
matlines(t, f, type='l', lty=2)

## ---- echo=TRUE, message=FALSE-------------------------------------------
library(imager)
name <- '../inst/extdata/lena.png'
f <- load.image(name)
plot(f, axes=F, interpolate=F, xlab="", ylab="")

## ---- echo=TRUE, message=FALSE-------------------------------------------
ssig <- sd(f)
sdnoise <- ssig/SNR
y <- f + rnorm(ncol(f)*nrow(f), mean=0, sd=sdnoise)
snrin <- SNR(f,y)
plot(y, axes=F, interpolate=F, xlab="", ylab="",
     main=format(round(snrin,2), nsmall = 2))

## ---- echo=TRUE, message=FALSE-------------------------------------------
wc <- FWT2_PO(as.array(squeeze(y)), L, qmf)
thr <- 3*sdnoise
aT <- wc*(abs(wc)>thr)
fest <- IWT2_PO(aT, L, qmf)
snrout <- SNR(f, fest)
plot(as.cimg(fest), axes=FALSE, xlab="", ylab="",
     main=format(round(snrout,2), nsmall=2))

