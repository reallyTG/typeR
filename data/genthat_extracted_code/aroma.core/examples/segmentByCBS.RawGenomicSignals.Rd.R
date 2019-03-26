library(aroma.core)


### Name: segmentByCBS.RawGenomicSignals
### Title: Segment copy numbers using the CBS method
### Aliases: segmentByCBS.RawGenomicSignals RawGenomicSignals.segmentByCBS
###   segmentByCBS,RawGenomicSignals-method
### Keywords: internal methods IO

### ** Examples

isEnvVarTRUE <- function(name) {
  value <- toupper(Sys.getenv(name))
  if (value == "yes") value <- "TRUE"
  isTRUE(as.logical(value))
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Simulating copy-number data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Number of loci
J <- 500

mu <- double(J)
mu[100:150] <- mu[100:150] + 1
mu[320:400] <- mu[320:400] - 1
eps <- rnorm(J, sd=1/2)
y <- mu + eps
x <- sort(runif(length(y), max=length(y))) * 1e5
w <- runif(J)
w[320:400] <- 0.001


cn <- RawCopyNumbers(y, x)
print(cn)

plot(cn, ylim=c(-3,3), col="#aaaaaa", xlab="Position (Mb)")

cnS <- binnedSmoothing(cn, by=500e3)
print(cnS)
lines(cnS, col="black", lwd=3)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Segment
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
legend <- c()

if (require("DNAcopy")) {
  fit <- segmentByCBS(cn)
  cnr <- extractCopyNumberRegions(fit)
  print(cnr)
  drawLevels(cnr, col="red", lwd=3)
  legend <- c(legend, red="CBS")
}

if (require("GLAD") && packageVersion("GLAD") != "9.9.9" &&
    !isEnvVarTRUE("_R_S3_METHOD_LOOKUP_BASEENV_AFTER_GLOBALENV_")) {
  fit <- segmentByGLAD(cn)
  cnr <- extractCopyNumberRegions(fit)
  print(cnr)
  drawLevels(cnr, col="blue", lwd=3)
  legend <- c(legend, blue="GLAD")
}

if (require("HaarSeg")) {
  fit <- segmentByHaarSeg(cn)
  cnr <- extractCopyNumberRegions(fit)
  print(cnr)
  drawLevels(cnr, col="orange", lwd=3)
  legend <- c(legend, orange="HaarSeg")
}

if (require("mpcbs")) {
  fit <- segmentByMPCBS(cn)
  cnr <- extractCopyNumberRegions(fit)
  print(cnr)
  drawLevels(cnr, col="white", lwd=6)
  drawLevels(cnr, col="purple", lwd=3)
  legend <- c(legend, purple="MPCBS")
}


if (length(legend) > 0) {
  legend("topleft", pch=19, col=names(legend), legend, bty="n", horiz=TRUE)
}



