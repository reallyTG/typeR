## ----setup, include=FALSE, cache=FALSE--------------------------------------------------
library(knitr)
# set global chunk options
opts_chunk$set(fig.path='figure/minimal-', fig.align='center', fig.show='hold')
options(formatR.arrow=TRUE,width=90)

## ----datagen, cache=TRUE, echo=TRUE-----------------------------------------------------
set.seed(12345)
suppressMessages(library(mhtboot))
n = 50;m = 500;m0 = 20;
sigeff = 1;
Sigma <- 0.25*diag(m)
X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
plot(density(X[,1]),main="density plot of coord 1")

## ----pboot,cache=TRUE,echo=TRUE---------------------------------------------------------
porder <- pboot.1sample(X=X,B=250,ncpus = 1)
plotpboot(porder = porder)

## ----ptrans,echo=TRUE,cache=TRUE--------------------------------------------------------
porder.tr <- ptrans(porder,trans="normal")
plotpboot(porder.tr)

## ----hitplots,cache=TRUE,echo=TRUE------------------------------------------------------
porder <- ptrans(porder = porder)
hitplots(porder = porder,alpha = 0.005)

## ----qelbow,echo=TRUE,cache=TRUE--------------------------------------------------------
out <- qelbow(porder = porder)
out

## ----mhtmain,echo=TRUE,cache=TRUE-------------------------------------------------------
out1 <- mht.1sample(X,ncpus = 1)
out1$cutoff
out1$signal

