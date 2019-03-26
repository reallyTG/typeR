library(aroma.cn)


### Name: findAtomicAberrations.CopyNumberRegions
### Title: Finds all possible atomic regions
### Aliases: findAtomicAberrations.CopyNumberRegions
###   CopyNumberRegions.findAtomicAberrations
###   findAtomicAberrations,CopyNumberRegions-method findAtomicAberrations
### Keywords: internal methods

### ** Examples

library("aroma.cn")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Local functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
xAxisBar <- function(x0, x1=NULL, y=par("usr")[3], lwd=4, col=par("col"),
                     length=0.04, xpd=FALSE, ...) {
  if (is.null(x1)) {
    x1 <- x0[2]
    x0 <- x0[1]
  }
  arrows(x0=x0, x1=x1, y0=y, code=3, angle=90, length=length, lwd=lwd,
         col=col, xpd=xpd, lend=2, ...)
} # xAxisBar()


verbose <- Arguments$getVerbose(-8, timestamp=TRUE)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Simulating copy-number data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build up CN profile generation by generation
pT <- cnr(1,2000, 2) +
     cnr(1000,1500) +
     cnr(1000,1250) +
     cnr(1650,1800) +
     cnr(200,300) - cnr(650,800)
print(pT)

# Simulate data from the track
cn <- simulateRawCopyNumbers(pT, n=2000, sd=1/2)
print(cn)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Find atomic aberrations
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
subplots(4, ncol=1)
par(mar=c(2,4,1,1)+0.1)

# Plot observed and true signals
plot(cn, col="#aaaaaa", ylim=c(0,5))
drawLevels(pT, col="white", lwd=4, lty=1)
drawLevels(pT, col="black", lwd=3, lty=6)
stext(side=3, pos=1, line=-1, "\"H=0\"", cex=1.5)

for (H in 1:3) {
  plot(cn, col="#aaaaaa", ylim=c(0,5))
  drawLevels(pT, col="white", lwd=4, lty=1)
  drawLevels(pT, col="black", lwd=3, lty=6)
  col <- H+1
  stext(side=3, pos=1, line=-1, sprintf("H=%d", H), cex=1.5, col=col)
  par <- par("usr")
  y0 <- par("usr")[3]
  y1 <- par("usr")[4]
  dy <- 0.05*(y1-y0)

  fit <- findAtomicAberrations(cnr=pT, data=cn, H=H, verbose=verbose)
  df <- fit$res

  for (kk in seq(length=nrow(df))) {
    dfKK <- df[kk,]
    segments <- as.integer(dfKK[,c("firstRegion", "lastRegion")])
    segments <- segments[1]:segments[2]
    xRange <- as.double(dfKK[,c("start", "stop")])
    cnrKK <- subset(pT, subset=segments)
    drawLevels(cnrKK, col=col, lwd=3)
    x <- xRange/1e6
    y <- y0 + 0.2*dy
    xAxisBar(x0=x[1], x1=x[2], y=y, col=col)
    box()
  }
} # for (H ...)




