library(dplR)


### Name: sss
### Title: Subsample Signal Strength
### Aliases: sss
### Keywords: misc

### ** Examples

data(ca533)
ca533.rwi <- detrend(ca533,method="Spline")
# assuming 1 core / tree
ca533.sss <- sss(ca533.rwi)

ca533.ids <- autoread.ids(ca533)
# done properly with >=1 core / tree as per the ids
ca533.sss2 <- sss(ca533.rwi,ca533.ids)

yr <- time(ca533)
plot(yr,ca533.sss,type="l",ylim=c(0.4,1),
     col="darkblue",lwd=2,xlab="Year",ylab="SSS")
lines(yr,ca533.sss2,lty="dashed",
      col="darkgreen",lwd=2)

# Plot the chronology showing a potential cutoff year based on SSS
ca533.crn <- chron(ca533.rwi)
def.par <- par(no.readonly=TRUE)
par(mar = c(2, 2, 2, 2), mgp = c(1.1, 0.1, 0), tcl = 0.25, xaxs='i')
plot(yr, ca533.crn[, 1], type = "n", xlab = "Year",
     ylab = "RWI", axes=FALSE)
cutoff <- max(yr[ca533.sss2 < 0.85])
xx <- c(500, 500, cutoff, cutoff)
yy <- c(-1, 3, 3, -1)
polygon(xx, yy, col = "grey80")
abline(h = 1, lwd = 1.5)
lines(yr, ca533.crn[, 1], col = "grey50")
lines(yr, ffcsaps(ca533.crn[, 1], nyrs = 32), col = "red", lwd = 2)
axis(1); axis(2); axis(3);
par(new = TRUE)
## Add EPS
plot(yr, ca533.sss2, type = "l", xlab = "", ylab = "",
     axes = FALSE, col = "blue")
abline(h=0.85,col="blue",lty="dashed")
axis(4, at = pretty(ca533.sss2))
mtext("SSS", side = 4, line = 1.1, lwd=1.5)
box()
par(def.par)




