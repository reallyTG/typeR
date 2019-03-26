## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
rm(list=ls())
library(highlight)
library(knitr)
##homedir <- '/home/rmcd/tex/d67/Rtutorial/'
options(digits=4)
figsize <- 4.5
opts_chunk$set(size='footnotesize', prompt=FALSE, comment=NA,
               fig.align='center', fig.width = figsize,
               fig.height=figsize, out.width='3.75in')
opts_knit$set(highlight = TRUE,
              eval.after='fig.cap',
              prompt=TRUE,
              renderer=renderer_latex(document=FALSE),
              size='footnotesize')
curr <- function(amt)  formatC(amt, format='f', digits=2)

## ----echo=FALSE----------------------------------------------------------
library(derivmkts)
library(mnormt)
library(markdown)

opts_chunk$set(collapse=TRUE)

## ------------------------------------------------------------------------
s <- 100; k <- 100; r <- 0.08; v <- 0.30; tt <- 2; d <- 0
bscall(s, k, v, r, tt, d)
bsput(s, c(95, 100, 105), v, r, tt, d)


## ------------------------------------------------------------------------
H <- 115
bscall(s, c(80, 100, 120), v, r, tt, d)
## Up-and-in call
uicall(s, c(80, 100, 120), v, r, tt, d, H)
bsput(s, c(80, 100, 120), v, r, tt, d)
## Up-and-out put
uoput(s, c(80, 100, 120), v, r, tt, d, H)

## ------------------------------------------------------------------------
s <- 100; k <- 100; r <- 0.08; v <- 0.30; tt <- 2; d <- 0.04
callperpetual(s, c(95, 100, 105), v, r, d)
callperpetual(s, c(95, 100, 105), v, r, d, showbarrier=TRUE)


## ------------------------------------------------------------------------
H <- 105
greeks(uicall(s, k, v, r, tt, d, H))


## ------------------------------------------------------------------------
powercontract <- function(s, v, r, tt, d, a) {
    price <- exp(-r*tt)*s^a* exp((a*(r-d) + 1/2*a*(a-1)*v^2)*tt)
}

## ------------------------------------------------------------------------
greeks(powercontract(s=40, v=.08, r=0.08, tt=0.25, d=0, a=2))

## ------------------------------------------------------------------------
bullspread <- function(s, v, r, tt, d, k1, k2) {
    bscall(s, k1, v, r, tt, d) - bscall(s, k2, v, r, tt, d)
}
greeks(bullspread(39:41, .3, .08, 1, 0, k1=40, k2=45))


## ----bullgamma, fig.cap='Gamma for a 40-45 bull spread.'-----------------
sseq <- seq(1, 100, by=0.5)
x <- greeks(bullspread(sseq, .3, .08, 1, 0, k1=40, k2=45), initcaps=TRUE)
plot(sseq, x['Gamma',], type='l')


## ----allgreeks, fig.cap='All option Greeks, computed using the greeks() function', fig.width=7.5, fig.height=6.5----
k <- 100; r <- 0.08; v <- 0.30; tt <- 2; d <- 0
S <- seq(.5, 250, by=.5)
Call <- greeks(bscall(S, k, v, r, tt, d))
Put <- greeks(bsput(S, k, v, r, tt, d))
y <- list(Call=Call, Put=Put)
par(mfrow=c(4, 4))  ## create a 4x4 plot
par(mar=c(2,2,2,2))
for (i in names(y)) {
    for (j in rownames(y[[i]])) {  ## loop over greeks
        plot(S, y[[i]][j, ], main=paste(i, j), ylab=j, type='l')
    }
}


## ------------------------------------------------------------------------
s <- 100; k <- 100; r <- 0.08; v <- 0.30; tt <- 2; d <- 0.03
binomopt(s, k, v, r, tt, d, nstep=3)
binomopt(s, k, v, r, tt, d, nstep=3, returnparams=TRUE)
binomopt(s, k, v, r, tt, d, nstep=3, putopt=TRUE)
binomopt(s, k, v, r, tt, d, nstep=3, returntrees=TRUE, putopt=TRUE)

## ------------------------------------------------------------------------
s <- 100; k <- 100; r <- 0.08; v <- 0.30; tt <- 2; d <- 0.03; m <- 3
geomavgpricecall(s, 98:102, v, r, tt, d, m)
geomavgpricecall(s, 98:102, v, r, tt, d, m, cont=TRUE)
geomavgstrikecall(s, k, v, r, tt, d, m)


## ------------------------------------------------------------------------
arithasianmc(s, k, v, r, tt, d, 3, numsim=5000, printsds=TRUE)


## ------------------------------------------------------------------------
arithavgpricecv(s, k, v, r, tt, d, 3, numsim=5000)


## ------------------------------------------------------------------------
s <- 100; kuo <- 95; v <- 0.30; r <-  0.08; t1 <- 0.50; t2 <- 0.75; d <- 0
kco <- 3.50

calloncall(s, kuo, kco, v, r, t1, t2, d, returnscritical=TRUE)

## ------------------------------------------------------------------------
putoncall(s, kuo, kco, v, r, t1, t2, d, returnscritical=TRUE)
callonput(s, kuo, kco, v, r, t1, t2, d, returnscritical=TRUE)
putonput(s, kuo, kco, v, r, t1, t2, d, returnscritical=TRUE)


## ------------------------------------------------------------------------
mertonjump(s, k, v, r, tt, d, lambda=0.5, alphaj=-0.2, vj=0.3)
c(bscall(s, k, v, r, tt, d), bsput(s, k, v, r, tt, d))

## ------------------------------------------------------------------------
coupon <- 8; mat <- 20; yield <- 0.06; principal <- 100; 
modified <- FALSE; freq <- 2
price <- bondpv(coupon, mat, yield, principal, freq)
price
bondyield(price, coupon, mat, principal, freq)
duration(price, coupon, mat, principal, freq, modified)
convexity(price, coupon, mat, principal, freq)


## ----quincunx, fig.cap='Output from the Quincunx function'---------------
par(mar=c(2,2,2,2))
quincunx(n=20, numballs=200, delay=0, probright=0.7)

## ----binomplot1, fig.cap='Basic option plot showing stock prices and nodes at which the option is exercised.\\label{fig:binomplot1}'----
binomplot(s, k, v, r, tt, d, nstep=6, american=TRUE, putopt=TRUE)


## ----binomplot2, fig.cap='Same plot as Figure \\ref{fig:binomplot1} except that values and arrows are added to the plot.\\label{fig:binomplot2}'----
binomplot(s, k, v, r, tt, d, nstep=6, american=TRUE, putopt=TRUE,
    plotvalues=TRUE, plotarrows=TRUE)

## ----binomplot3, fig.cap="Binomial plot when nstep is 40.\\label{fig:binomplot3}"----
d <- 0.06
binomplot(s, k, v, r, tt, d, nstep=40, american=TRUE)

## ----binomplot4, fig.cap="Binomial plot when nstep is 40 using the argument ylimval to focus on a subset.\\label{fig:binomplot4}"----
d <- 0.06
binomplot(s, k, v, r, tt, d, nstep=40, american=TRUE, ylimval=c(75, 225))

