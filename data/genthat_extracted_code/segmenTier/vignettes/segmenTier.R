## ---- echo=FALSE, fig.width=4, fig.height=3------------------------------
par(mai=c(.5,.5,.05,.05), mgp=c(1.2,.3,0), tcl=-.25)
plot(seq(-1,1,.01), seq(-1,1,.01)^3, type="l", ylab=expression("scaled Pearson correlation"), xlab="Pearson correlation", ylim=c(-2,2),xlim=c(-1.25,1.25))
abline(a=0, b=1, col="darkgray", lty=3)
points(c(-1.25,1.25), c(-1.25^3,1.25^3),col="red",pch=4)
legend("bottomright", c("E=1","E=3","nui=1.25"), bty="n", col=c("darkgray","black","red"), pch=c(NA,NA,4), lty=c(3,1,NA))
arrows(x0=-.3, x1=.3, y0=.25,code=3,lwd=2,lty=2, length=0.1, col="blue")
text(0,.5, expression(score %->%  0), col="blue")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("segmenTier")

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github("raim/segmenTier", subdir = "pkg")

## ---- fig.width=7, fig.height=3------------------------------------------
library(segmenTier)

data(primseg436) # RNA-seq time-series data

# Fourier-transform and cluster time-series:
tset <- processTimeseries(ts=tsd, na2zero=TRUE, use.fft=TRUE,
                          dft.range=1:7, dc.trafo="ash", use.snr=TRUE)
cset <- clusterTimeseries(tset, K=12)
# ... segment it:
segments <- segmentClusters(seq=cset, M=100, E=2, nui=3, S="icor")
# and inspect results:
plotSegmentation(tset, cset, segments, cex=.5, lwd=2)
print(segments)
## and get segment border table for further processing
head(segments$segments)

## ---- eval=FALSE---------------------------------------------------------
#  demo("segment_test", package = "segmenTier")

## ---- eval=FALSE---------------------------------------------------------
#  demo("segment_data", package = "segmenTier")

