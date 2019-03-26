library(fda)


### Name: refinery
### Title: Reflux and tray level in a refinery
### Aliases: refinery
### Keywords: datasets

### ** Examples

    attach(refinery)
# allow space for an axis on the right 
    op <- par(mar=c(5, 4, 4, 5)+0.1)
# plot uval 
    plot(Time, Reflux, type="l", bty="n")
# add yval 
    y.u <- diff(range(Tray47))/diff(range(Reflux))
    u0 <- min(Reflux)
    y0 <- min(Tray47)

    lines(Time, u0+(Tray47-y0)/y.u, lty=3, lwd=1.5, col="red")
    y.tick <- pretty(range(Tray47))
    axis(4, at=u0+(y.tick)/y.u, labels=y.tick, col="red", lty=3,
            lwd=1.5)
# restore previous plot margins
    par(op)
    detach(refinery)



