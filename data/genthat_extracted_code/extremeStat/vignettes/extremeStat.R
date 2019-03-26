## ----instcran, eval=FALSE------------------------------------------------
#  install.packages("extremeStat")
#  
#  # install the development version from github:
#  berryFunctions::instGit("brry/berryFunctions")
#  berryFunctions::instGit("brry/extremeStat")

## ----library, echo=TRUE--------------------------------------------------
library(extremeStat)

## ----dataHist, fig.show='hold', echo=-3----------------------------------
data(rain, package="ismev")
rain <- rain[rain>2]
par(mar=c(3.2,3.2,1.5,0.7), mgp=c(2.1,0.7,0))
hist(rain, breaks=80, col=4, las=1)
# Visual inspection is easier on a logarithmic scale:
berryFunctions::logHist(rain, breaks=80, col=3, las=1)

## ----dlf-----------------------------------------------------------------
dlf <- distLquantile(rain[1:900], probs=c(0.8,0.9,0.99,0.999), list=TRUE, quiet=TRUE)

## ----dlprint, eval=1-----------------------------------------------------
printL(dlf)

## ----dlplot, echo=-1, fig.height=3.5, fig.width=5.5----------------------
par(mar=c(3.9,3.9,1.5,0.7), mgp=c(2.8,0.7,0))
plotLquantile(dlf, nbest=8, linargs=list(lwd=2), heights=seq(0.04, 0.01, len=8), breaks=80)

## ----dlquant-------------------------------------------------------------
dlf$quant # distLquantile output if returnlist=FALSE (the default)

## ----weight, echo=-1, fig.height=3.5, fig.width=5.5----------------------
par(mar=c(3.2,3.6,2.6,0.7), mgp=c(2.1,0.7,0))
plotLweights(dlf, legargs=list(cex=0.8, bg="transparent") )

## ----rmse_vis, fig.height=4, fig.width=7, echo=-1------------------------
par(mar=c(2,4,1.5,0.5))
data("annMax") # annual discharge maxima in the extremeStat package itself
sel <- c("wak","lap","revgum")
dlf <- distLfit(annMax, sel=sel, quiet=TRUE)
col <- plotLfit(dlf, cdf=TRUE, sel=sel)$distcol
x <- sort(annMax)
for(d in 3:1) segments(x0=x, y0=lmomco::plmomco(x, dlf$parameter[[sel[d]]]), 
                             y1=ecdf(x)(x), col=col[d])

## ----prob, echo=FALSE, fig.height=1, fig.width=5.5-----------------------
  par(mar=rep(0,4))
  plot(1:6, type="n", ylim=c(1,6), axes=F, ann=F)
  arrows(x0=1, y0=4, x1=6, code=3, angle=90, length=0.07)
  arrows(x0=4, y0=4, x1=6, code=1, angle=90, length=0.07)
  arrows(x0=4, y0=3, x1=6, code=3, angle=90, length=0.07)
  text(x=c(1,4,5.5,6), y=rep(5,4), c(0,"t","p",1), col=c(1,1,2,1))
  text(x=c(4,5.5,6),   y=rep(2,3), c(0,"p2",1),    col=c(1,2,1))
  text(3.8, 3, "truncated sample", adj=1)
  points(x=rep(5.5,2), y=c(3,4), col=2, pch=16)
#text(7, 5.5, expression(frac(1-p, 1-t)*"  =  "* frac(1-p2, 1-0)), adj=0, cex=1.2)
#text(7, 2.5, expression("p2  =  "*frac(p-t, 1-t)), adj=0, cex=1.2)


## ----trunc, echo=-1, fig.height=3.5, fig.width=5.5-----------------------
par(mar=c(3.2,3.6,2.6,0.7), mgp=c(2.1,0.7,0))
d <- distLquantile(rain, truncate=0.9, probs=0.999, quiet=TRUE, list=TRUE)
plotLquantile(d, breaks=50)

## ----teff----------------------------------------------------------------
canload <- suppressWarnings(try(load("qq.Rdata"), silent = TRUE))
if(inherits(canload, "try-error")) {
tt <- c(seq(0,0.5,0.1), seq(0.55,0.99,len=50))
if(interactive()) lapply <- pbapply::pblapply # for progress bars
qq <- lapply(tt, function(t) 
  distLquantile(rain, truncate=t, probs=0.999, quiet=TRUE, gpd=FALSE))     
dlf00 <- plotLfit(distLfit(rain), nbest=17)
dlf99 <- plotLfit(distLfit(rain, tr=0.99), nbest=17)
save(tt,qq,dlf99,dlf00, file="qq.Rdata") 
}

## ----teffplot, fig.height=3.5, fig.width=5.5-----------------------------
load("qq.Rdata")
par(mar=c(3,2.8,2.2,0.4), mgp=c(1.8,0.5,0))
plot(tt,tt, type="n", xlab="truncation proportion", ylab="Quantile estimate",
     main="truncation effect for 6k values of rain", ylim=c(22,90), las=1,
     xlim=0:1, xaxs="i", xaxt="n") ;  axis(1, at=0:5*0.2, labels=c("0",1:4*0.2,"1"))
dn <- dlf00$distnames ; names(dlf00$distcols) <- dn
for(d in dn) lines(tt, sapply(qq, "[", d, j=1), col=dlf00$distcols[d], lwd=2)
abline(h=berryFunctions::quantileMean(rain, probs=0.999), lty=3)
gof <- formatC(round(dlf00$gof[dn,"RMSE"],3), format='f', digits=3)
legend("center", paste(gof,dn), col=dlf00$distcols, lty=1, bg="white", cex=0.5)
text(0.02, 62, "empirical quantile (full sample)", adj=0)

## ----teffplotrmse, fig.height=3.5, fig.width=5.5, echo=FALSE-------------
par(mfrow=c(1,2), mar=c(1.5,2,0,0.5), oma=c(2,2,2,0) )
plot(1, type="n", xlim=0:1, xaxs="i", log="y", ylim=c(0.01,0.15), axes=FALSE, ylab="", xlab="")
axis(1, at=0:5*0.2, labels=c("0",1:4*0.2,"1"))
berryFunctions::logAxis(2)
for(d in dn) lines(tt, sapply(qq, "[", d, j="RMSE"), col=dlf00$distcols[d])

plot(1, type="n", xlim=0:1, xaxs="i", ylim=c(0.011,0.025), xaxt="n", ylab="RMSE")
title(xlab="truncation proportion", main="truncation effect for 6k values of rain", mgp=c(0.5,0,0), outer=TRUE)
title(ylab="RMSE", mgp=c(1,0,0), outer=TRUE)
axis(1, at=0:5*0.2, labels=c("0",1:4*0.2,"1"))
for(d in dn) lines(tt, sapply(qq, "[", d, j="RMSE"), col=dlf00$distcols[d])

## ----ssdep, eval=FALSE---------------------------------------------------
#  canload <- suppressWarnings(try(load("sq.Rdata"), silent = TRUE))
#  if(inherits(canload, "try-error")) {
#  set.seed(1)
#  ss <- c(30,50,70,100,200,300,400,500,1000)
#  rainsamplequantile <- function() sapply(ss, function(s) distLquantile(sample(rain,s),
#            probs=0.999, plot=F, truncate=0.8, quiet=T, sel="wak", gpd=F, weight=F))
#  sq <- pbapply::pbreplicate(n=100, rainsamplequantile())
#  save(ss,sq, file="sq.Rdata")
#  }

## ----ssdepplot, fig.height=3.5, fig.width=5.5----------------------------
load("sq.Rdata")
par(mar=c(3,2.8,2.2,0.4), mgp=c(1.7,0.5,0))
sqs <- function(prob,row) apply(sq, 1:2, quantile, na.rm=TRUE, probs=prob)[row,]
berryFunctions::ciBand(yu=sqs(0.6,1), yl=sqs(0.4,1), ym=sqs(0.5,1), x=ss, 
    ylim=c(25,75), xlim=c(30,900), xlab="sample size", ylab="estimated 99.9% quantile", 
    main="quantile estimations of small random samples", colm="blue")
berryFunctions::ciBand(yu=sqs(0.6,2), yl=sqs(0.4,2), ym=sqs(0.5,2), x=ss, add=TRUE)
abline(h=quantile(rain,0.999))
text(250, 50, "empirical", col="forestgreen")
text(400, 62, "Wakeby", col="blue")
text(0, 61, "'True' population value", adj=0)
text(600, 40, "median and central 20% of 100 simulations")

## ----RP, echo=-1, warning=FALSE, fig.height=4, fig.width=5.5-------------
par(mar=c(3,2.8,1.2,0.4), mgp=c(1.8,0.5,0))
dlf <- distLextreme(annMax, quiet=TRUE)
plotLextreme(dlf, log=TRUE, legargs=list(cex=0.6, bg="transparent"), nbest=17)
dlf$returnlev[1:20,]


## ----help, eval=FALSE----------------------------------------------------
#  ?extremeStat

