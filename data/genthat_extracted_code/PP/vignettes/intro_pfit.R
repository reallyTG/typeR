## ----settings------------------------------------------------------------
knitr::opts_chunk$set(message = FALSE, results='hide')

## ----start, message=FALSE, warning=FALSE---------------------------------
library(PP)

set.seed(1337)

# simulate some intercepts
diffpar <- seq(-3,3,length=15)
# simulate some slope parameters
sl     <- round(runif(15,0.5,1.5),2)
la     <- round(runif(15,0,0.25),2)
ua     <- round(runif(15,0.8,1),2)

# simulate response matrix (not following any IRT model)
awm <- matrix(sample(0:1,100*15,replace=TRUE),ncol=15)

## ----1pl, message=FALSE, warning=FALSE-----------------------------------
# MLE
res1plmle <- PP_4pl(respm = awm,thres = diffpar,type = "mle")
# WLE
res1plwle <- PP_4pl(respm = awm,thres = diffpar,type = "wle")

## ----234-pl, message=FALSE, warning=FALSE--------------------------------

# ------------------------------------------------------------------------
## 2PL model #####
# ------------------------------------------------------------------------
# MLE
res2plmle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "mle")
# WLE
res2plwle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "wle")

# ------------------------------------------------------------------------
## 3PL model #####
# ------------------------------------------------------------------------
# MLE
res3plmle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,type = "mle")
# WLE
res3plwle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,type = "wle")
# ------------------------------------------------------------------------
## 4PL model #####
# ------------------------------------------------------------------------
# MLE
res4plmle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "mle")
# WLE
res4plwle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "wle")

## ----pfit, message=FALSE, warning=FALSE----------------------------------

# ------------------------------------------------------------------------
## 1PL model #####
# ------------------------------------------------------------------------
## LZ*-Index #####
pfit1pl_lz <- Pfit(respm=awm,pp=res1plwle,fitindices="lzstar")
## LZ*-Index combined with Infit-Outfit #####
pfit1pl_li <- Pfit(respm=awm,pp=res1plwle,fitindices=c("lzstar","infit","outfit"))
# ------------------------------------------------------------------------
## 2PL model #####
# ------------------------------------------------------------------------
## LZ*-Index #####
pfit2pl_lz <- Pfit(respm=awm,pp=res2plwle,fitindices="lzstar")
## LZ*-Index combined with Infit-Outfit #####
pfit2pl_li <- Pfit(respm=awm,pp=res2plwle,fitindices=c("lzstar","infit","outfit"))
# ------------------------------------------------------------------------
## 3PL model #####
# ------------------------------------------------------------------------
## LZ*-Index #####
pfit3pl_lz <- Pfit(respm=awm,pp=res3plwle,fitindices="lzstar")
## LZ*-Index combined with Infit-Outfit #####
pfit3pl_li <- Pfit(respm=awm,pp=res3plwle,fitindices=c("lzstar","infit","outfit"))
# ------------------------------------------------------------------------
## 4PL model #####
# ------------------------------------------------------------------------
## LZ*-Index #####
pfit4pl_lz <- Pfit(respm=awm,pp=res4plwle,fitindices="lzstar")
## LZ*-Index combined with Infit-Outfit #####
pfit4pl_li <- Pfit(respm=awm,pp=res4plwle,fitindices=c("lzstar","infit","outfit"))

## ----wle, message=FALSE, warning=FALSE-----------------------------------
# ------------------------------------------------------------------------
## 1PL model #####
# ------------------------------------------------------------------------
## LZ*-Index #####
## mle ####
pfit1pl_mle_l <- Pfit(respm=awm,pp=res1plmle,fitindices="lzstar")
## wle ####
pfit1pl_wle_l <- Pfit(respm=awm,pp=res1plwle,fitindices="lzstar")

## ----example-1, message=FALSE, warning=FALSE-----------------------------
# eine Grafik erzeugen

res.pp <- Pfit(respm=awm,pp=res1plmle,fitindices=c("lzstar"),SE=TRUE)
x<-seq(-4,4,length=200)
s <- 1
mu <- 0
y <- (1/(s*sqrt(2*pi))) * exp(-((x-mu)^2)/(2*s^2))
plot(x,y, type="l", lwd=2, col = "blue", xlim = c(-8.5,8.5),xlab="", ylab="")
title(main="Density plot of lz* Person-Fit", xlab="density", ylab="score")
lines(density(res.pp$lzstar[,"lzstar"], bw = 0.5), lwd = 2, lty = 2)
rug(res.pp$lzstar[,"lzstar"],col="red")

# zweite Grafik erzeugen
x <- 1:nrow(res.pp$lzstar)
avg <- res.pp$lzstar[,"lzstar"]
sdev <- res.pp$lzstar[,"lzs_se"]

plot(avg, x,
     xlim=range(c(avg-sdev, avg+sdev)),
     pch=19, ylab="Person", xlab="Person-Fit +/- SD",
     main="Plot of Person-Fit with SE"
)
arrows(avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)
abline(v=0,col = "red", lwd = 3)

## ----example-2, message=FALSE, warning=FALSE-----------------------------
data(pp_amt)
betas <- pp_amt$betas$Itemparameter
diffpar <- pp_amt$Itemparameter
# slope parameters
awm <- pp_amt$daten_amt[,grep("i\\d{1,3}",colnames(pp_amt$daten_amt))]

# estimate ability parameter and personfit
# the computation of the standard error takes a while, therefore we use only a part of the provided data
set.seed(1800)
# sample items
sampi <- order(sample(1:ncol(awm),40,replace = F))
# sample persons
sampp <- order(sample(1:nrow(awm),100,replace = F))
awm.samp <- awm[sampp,sampi]
# apply(awm.samp, 2, function(x)!all(is.na(x)))
awm.samp <- awm.samp[apply(awm.samp, 1, function(x)!all(is.na(x))),] #only persons with no NA
out <- PPass(respdf = awm.samp,thres = betas[sampi], items="all",type = "wle",
             mod=c("1PL"), fitindices= c("lz","lzstar","infit","outfit"),SE=TRUE)

# first example of illustration
lim <- max(abs(c(min(out$estimate),max(out$estimate))))
x <- seq(-lim,lim,length=200)
s  <- 1
mu <- 0
y <- (1/(s*sqrt(2*pi))) * exp(-((x-mu)^2)/(2*s^2))
plot(x,y, type="l", lwd=2, col = "blue", xlim = c(-lim,lim),xlab="", ylab="")
title(main="Density plot of lz* Person-Fit", xlab="density", ylab="score")
lines(density(out[,"lzstar"], bw = 0.5), lwd = 2, lty = 2)
rug(out[,"lzstar"],col="red")

# second example of illustration
x <- 1:nrow(out)
avg <- out[,"lzstar"]
sdev <- out[,"lzs_se"]

plot(avg, x,
     yaxt="n",
     xlim=range(c(avg-sdev, avg+sdev)),
     pch=19, ylab="Person", xlab="Person-Fit +/- SD",
     main="Plot of Person-Fit with SE"
)
axis(side=2, at = c(1:nrow(out)),labels = c(1:nrow(out)), las = 2,cex.axis=0.66)
arrows(avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)
abline(v=0,col = "red", lwd = 3)

