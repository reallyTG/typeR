library(archdata)


### Name: OxfordPots
### Title: Distribution of Late Romano-British Oxford Pottery
### Aliases: OxfordPots
### Keywords: datasets

### ** Examples

data(OxfordPots)
# Construct Fulford and Hodder's Figure 3
Oxford.lm1 <- lm(log(OxfordPct)~OxfordDst, OxfordPots, subset=WaterTrans==0)
Oxford.lm2 <- lm(log(OxfordPct)~OxfordDst, OxfordPots, subset=WaterTrans==1)
plot(log(OxfordPct)~OxfordDst, OxfordPots, xlim=c(0, 160), yaxt="n", ylim=c(0, 3.25),
     ylab="Percentage of Oxford Pottery", xlab="Distance (miles)", 
     pch=c(1, 16)[WaterTrans+1], cex=1.5, lwd=2)
# Add log y-axis
axis(2, log(c(1, 5, 10, 20)), c(1, 5, 10, 20), las=1)
abline(Oxford.lm1, lwd=2)
abline(Oxford.lm2, lwd=2)



