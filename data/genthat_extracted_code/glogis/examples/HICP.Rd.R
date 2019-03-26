library(glogis)


### Name: HICP
### Title: Harmonised Index of Consumer Prices (1990-2010, OECD)
### Aliases: HICP hicps
### Keywords: datasets

### ** Examples

## price series
data("HICP", package = "glogis")

## corresponding raw unadjusted inflation rates (in percent)
hicp <- 100 * diff(log(HICP))

## seasonal adjustment of inflation rates (via STL)
hicps1 <- do.call("merge", lapply(1:ncol(hicp), function(i) {
  z <- na.omit(hicp[,i])
  coredata(z) <- coredata(as.ts(z) - stl(as.ts(z), s.window = 13)$time.series[, "seasonal"])
  z
}))
colnames(hicps1) <- colnames(hicp)

## load X-12-ARIMA adjusted inflation rates
data("hicps", package = "glogis")

## compare graphically for one country (Austria)
plot(hicp[, "Austria"], lwd = 2, col = "lightgray")
lines(hicps1[, "Austria"], col = "red")
lines(hicps[, "Austria"], col = "blue")
legend("topleft", c("unadjusted", "STL", "X-12-ARIMA"), lty = c(1, 1, 1),
  col = c("lightgray", "red", "blue"), bty = "n")

## compare graphically across all countries (via lattice)
if(require("lattice")) {
trellis.par.set(theme = canonical.theme(color = FALSE))
xyplot(merge(hicp, hicps1, hicps), 
  screen = names(hicp)[rep(1:ncol(hicp), 3)],
  col = c("lightgray", "red", "blue")[rep(1:3, each = ncol(hicp))],
  lwd = c(2, 1, 1)[rep(1:3, each = ncol(hicp))])
}





