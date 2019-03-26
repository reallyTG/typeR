## ----packages and data, echo=FALSE, results="hide", message=FALSE,warning=FALSE----
require(knitr)
require(wCorr)
require(lattice)
require(captioner)

# set layout so a figure label appears to go with the figure
trellis.device()
trellis.par.set(list(layout.widths  = list(left.padding = 3, right.padding = 3),
                     layout.heights = list(top.padding = -1, bottom.padding = 3))) 
##load("../vignettes/sim/ML.RData")
#load("../vignettes/sim/aggML.RData")
#load("../vignettes/sim/fast.RData")
#load("../vignettes/sim/speed.RData")

#load("aggML.RData")
#load("fast.RData")
#load("speed.RData")
load("../R/sysdata.rda")

## ----setup fast, echo=FALSE, results="hide", message=FALSE, warning=FALSE----
# fast$i <- rep(1:(nrow(fast)/2),each=2)
# mfast <- merge(subset(fast,fast),
#                subset(fast,!fast, c("i", "est")),
#                by="i",
#                suffixes=c(".fast",".slow"))
# mfast$fast <- NULL
# mfast$absdrho <- pmax(abs(mfast$est.fast - mfast$est.slow), 1E-16)
# aggfast <- summaryBy(absdrho ~ n + rho + type, data=mfast, FUN=mean, na.rm=TRUE)
fmax <- max(aggfast$absdrho.mean)
fmax10 <- ceiling(log10(fmax))

## ----tables and figures, echo=FALSE, results="hide", message=FALSE,warning=FALSE----
fig_nums <- captioner()
table_nums <- captioner(prefix = "Table")

MLRMSE <- fig_nums("MLRMSE", "")
Polychoric <- table_nums("Polychoric", "")
Polyserial <- table_nums("Polyserial", "")
fastMAD <- table_nums("fastMAD", "")
speedi <- table_nums("speedi", "")

## ----ML RMSE plot, echo=FALSE,fig.width=7, fig.height=5.5----------------
#ml <- subset(ML, type %in% c("Polychoric", "Polyserial"))
#ml$rmse <- (ml$est - ml$rho)^2

#aggml <- summaryBy(rmse ~ n + rho + type + ML, data=ml, FUN=mean, na.rm=TRUE)
#aggml$rmse.mean <- sqrt(aggml$rmse.mean)
#aggml$ml <- ifelse(aggml$ML==TRUE, "ML=TRUE", "ML=FALSE")
#aggml$nt <- factor(paste("n=",aggml$n))
xyplot(rmse.mean ~ rho|type + nt,
       data=aggml,
       groups=ml,
       scales=list(y=list(log=10, cex=0.7), x = list(cex=0.7)),
       type=c("l", "g"),
       ylab="RMSE",
       xlab=expression(rho),
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2)))

## ----ML RMSE table polyc, echo=FALSE-------------------------------------
#ml$i <- rep(1:(nrow(ml)/2),each=2)
#mml <- merge(subset(ml,ML),
#               subset(ml,!ML, c("i", "est")),
#               by="i",
#               suffixes=c(".ml",".nonml"))
#mml$absd <- abs(mml$est.ml - mml$est.nonml)
#aggt1_0 <- summaryBy(absd ~ type + n + ML, data=subset(mml, #type=="Polychoric"), FUN=mean, na.rm=TRUE)
#aggt1_0$ML <- NULL

#aggt1 <- summaryBy(rmse ~ type + n + ML, data=subset(ml, type=="Polychoric"), FUN=mean, na.rm=TRUE)

#aggt1$rmse.mean <- sqrt(aggt1$rmse.mean)
mg <- merge(subset(aggt1, ML==TRUE, c("type", "n", "rmse.mean")),
            subset(aggt1, ML==FALSE, c("type", "n", "rmse.mean")),
            by=c("type", "n"))
mg$rmse.mean.diff <- mg$rmse.mean.x - mg$rmse.mean.y
mg <- merge(mg, aggt1_0, by=c("type", "n"))
colnames(mg) <- c("Correlation type", "n", "RMSE ML=TRUE", "RMSE ML=FALSE", "RMSE difference", "RMAD")
mg[,3:6] <- round(mg[,3:5],4)
kable(mg)
mg1 <- mg
#knitr::asis_output("\\")

## ----ML RMSE table polys, echo=FALSE-------------------------------------
#aggt2_0 <- summaryBy(absd ~ type + n + ML, data=subset(mml, type=="Polyserial"), FUN=mean, na.rm=TRUE)
#aggt2_0$ML <- NULL

#aggt2 <- summaryBy(rmse ~ type + n + ML, data=subset(ml, type=="Polyserial"), FUN=mean, na.rm=TRUE)
#aggt2$rmse.mean <- sqrt(aggt2$rmse.mean)


mg <- merge(subset(aggt2, ML==TRUE, c("n", "type", "rmse.mean")),
            subset(aggt2, ML==FALSE, c("type", "n", "rmse.mean")),
            by=c("type", "n"))
mg$rmse.mean.diff <- mg$rmse.mean.x - mg$rmse.mean.y
mg <- merge(mg, aggt2_0, by=c("type", "n"))
colnames(mg) <- c("Correlation type", "n", "RMSE ML=TRUE", "RMSE ML=FALSE", "RMSE difference", "RMAD")
mg[,3:6] <- round(mg[,3:5],4)
kable(mg)
mg2 <- mg

## ----fast MAD plot, echo=FALSE,fig.width=7, fig.height=3.5---------------
xyplot(absdrho.mean ~ rho|type,
       data=aggfast,
       groups=n,
       type=c("l", "g"),
       ylab="RMAD",
       scales=list(y=list(log=10, cex=0.7), x=list(cex=0.7)),
       xlab=expression(rho),
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2))
       )

## ----plot speed, echo=FALSE,fig.width=7, fig.height=3.5------------------
# speed$class <- ifelse(speed$ML, "ML=T,", "ML=F,")
# speed$class <- paste0(speed$class, ifelse(speed$fast, "fast=T", "fast=F"))
# speed$t <- pmax(speed$t, 0.001)
# agg <- summaryBy(t ~ n + type + class, data=speed, FUN=mean, na.rm=TRUE)
xyplot(t.mean ~ n|type,
       data=subset(aggSpeed, type %in% c("Polyserial", "Polychoric")),
       type=c("l", "g"),
       ylab="Computing Time",
       scales=list(y=list(log=10, cex=0.7), x=list(log=10, cex=0.7)),
       xlab="n",
       groups=class,
       auto.key=list(lines=TRUE, points=FALSE, space="right", cex=0.7),
       par.settings=list(superpose.line=list(lwd=2), plot.line=list(lwd=2))
       )

