## ----packages and data, echo=FALSE, results="hide", message=FALSE, warning=FALSE----
require(wCorr)
require(lattice)
require(captioner)
# set layout so a figure label appears to go with the figure
trellis.device()
trellis.par.set(list(layout.widths  = list(left.padding = 3, right.padding = 3),
                     layout.heights = list(top.padding = -1, bottom.padding = 3)))
#load("..//vignettes/sim/ntime.RData")
##load("..//vignettes/sim/bias.RData")
#load("..//vignettes/sim/aggbias.RData")
#load("..//vignettes/sim/wgtvrho.RData")
#load("..//vignettes/sim/wgtvn.RData")
#load("..//vignettes/sim/spear.RData")

# load("ntime.RData")
# load("aggbias.RData")
# load("wgtvrho.RData")
# load("wgtvn.RData")
# load("spear.RData")
load("../R/sysdata.rda")



## ----tables and figures, echo=FALSE, results="hide", message=FALSE,warning=FALSE----
fig_nums <- captioner()
table_nums <- captioner(prefix = "Table")

theta <- fig_nums("theta", "")
biasVsRho <- table_nums("biasVsRho", "")
rmseVsRho <- table_nums("rmseVsRho", "")
rmseVsRho2 <- table_nums("rmseVsN", "")
speedi <- table_nums("speedi", "")
rmseVsRho3 <- table_nums("rmseVsRho2", "")
rmseVsN <- table_nums("rmseVsN2", "")

## ----theta,echo=FALSE,results="hide",fig.width=7, fig.height=3-----------
x <- seq(-3,3,by=0.01) 
y <- dnorm(x)
par0 <- par(no.readonly=TRUE)
par(ann=FALSE)
par(mar=c(5,2,1,1)+0.1)
plot(x,y,type="l",xlab="y",ylab="Density", xaxt="n", yaxt="n")
axis(1,at=c(-2,-0.5,1.6), labels=expression(theta[3],theta[4],theta[5]))
text(x=c(-2.5,-1.25,0.55,2.3),y=c(0.05,0.05,0.05,0.08), labels=paste0("m=",1:4))
theta <- c(-2,-0.5,1.6)
for(i in 1:3) {
  lines(rep(theta[i],2), c(-1,dnorm(theta[i])))
}
par(ann=TRUE)
par(mgp=c(0.5,0,0))
title(ylab="density")
par(mgp=c(3,1,0))
title(xlab="Y")
par(par0)

## ----bias Versus rho, echo=FALSE,fig.width=7, fig.height=5---------------
#bias$rmse <- sqrt( (bias$est - bias$rho)^2 )
#bias$bias <- bias$est - bias$rho
#aggbias <- summaryBy(bias + rmse  ~ n + rho + type, data=bias, FUN=mean, na.rm=TRUE)

xyplot(bias.mean ~ rho|type,
      data=aggbias,
      groups=n,
            type=c("l","g"),
      ylab="Bias",
      xlab=expression(rho),
      scales=list(x=list(cex=0.7), y=list(cex=0.7)),
      auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
      par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----rmse Versus rho, echo=FALSE,fig.width=7, fig.height=3.5-------------
xyplot(rmse.mean ~ rho|type,
      data=aggbias,
      groups=n,
      scales=list(y=list(log=10, cex=0.7), x=list(cex=0.7)),
      ylab="RMSE",
      xlab=expression(rho),
            type=c("l","g"),
      auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
      par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----rmse Versus n, echo=FALSE,fig.width=7, fig.height=3.5---------------
#aggbias2 <- summaryBy(rmse  ~ n+type, data=bias, FUN=mean, na.rm=TRUE)
xyplot(rmse.mean ~ n,
     groups=type,
      data=aggbias2,
      ylab="RMSE",
      xlab="n",
      scales=list(y=list(log=10, cex=0.7), x=list(log=10, cex=0.7)),
      type=c("l","g"),
      auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
      par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----time Versus n, echo=FALSE,fig.width=7, fig.height=4-----------------
# agg <- summaryBy(t ~ n + type, data=ntime, FUN=mean, na.rm=TRUE)
# agg$t.mean <- ifelse(agg$t.mean==0, 0.001,agg$t.mean)

xyplot(t.mean ~ n,
       data=aggTime,
       scales=list(y=list(log=10, cex=0.7), x=list(log=10, cex=0.7)),
       groups=type,
       type=c("l","g"),
       ylab="Computing time (s)",
       xlab="n",
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----wgt Versus rho plot, echo=FALSE,fig.width=7, fig.height=5.5---------
# wgt <- wgtvrho
# wgt$absdrho <- abs(wgt$est - wgt$rho)
# 
# agg <- summaryBy(absdrho ~ rho + usew + type, data=wgt, FUN=mean, na.rm=TRUE)
# agg$weight <- ifelse(agg$usew, "Weighted", "Unweighted")

xyplot(absdrho.mean ~ rho|type,
       data=aggWgtvrho,
       groups=weight,
       scales=list(y=list(log=10, cex=0.7), x=list(cex=0.7)),
             type=c("l","g"), 
       ylab="MAD",
       xlab=expression(rho),
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----wgt v n plot, echo=FALSE,fig.width=7, fig.height=5.5----------------
# wgtvn <- wgtvn[wgtvn$type!= "Spearman",]
# 
# wgt <- rbind(wgtvn, spear)
# wgt$mserho <- (wgt$est - wgt$rho)^2
# 
# agg <- summaryBy(mserho ~ n + usew + type, data=wgt, FUN=mean, na.rm=TRUE)
# agg$rmserho <- sqrt(agg$mserho)
# agg$weight <- ifelse(agg$usew, "Weighted", "Unweighted")

xyplot(rmserho ~ n|type,
       data=aggWgtvn,
       groups=weight,
       scales=list(y=list(log=10, cex=0.7), x=list(log=10, cex=0.7)),
             type=c("l","g"),
       ylab="RMSE",
       xlab="n",
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

