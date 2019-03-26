library(MortCast)


### Name: leecarter.estimate
### Title: Lee-Carter Estimation
### Aliases: leecarter.estimate

### ** Examples

data(mxM, package = "wpp2017")
mx <- subset(mxM, name == "Netherlands")[,4:16]
rownames(mx) <- c(0,1, seq(5, 100, by=5))
lc.ax.avg <- leecarter.estimate(mx)
lc.ax.last <- leecarter.estimate(mx, ax.index=ncol(mx))
plot(lc.ax.avg$ax, type="l")
lines(lc.ax.last$ax, col="blue")




