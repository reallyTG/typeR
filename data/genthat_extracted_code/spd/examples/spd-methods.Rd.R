library(spd)


### Name: spd-methods
### Title: Method: Semi-Parametric Distribution
### Aliases: pspd dspd qspd rspd dspd-methods pspd-methods qspd-methods
###   rspd-methods rspd,ANY,ANY,ANY-method rspd,vector,SPD,logical-method
###   rspd,vector,SPD,missing-method dspd,ANY,ANY,ANY-method
###   dspd,vector,SPD,logical-method dspd,vector,SPD,missing-method
###   pspd,ANY,ANY,ANY-method pspd,vector,SPD,logical-method
###   pspd,vector,SPD,missing-method qspd,ANY,ANY,ANY-method
###   qspd,vector,SPD,logical-method qspd,vector,SPD,missing-method
### Keywords: distribution

### ** Examples
## Not run: 
##D library(MASS)
##D x = SP500/100
##D fit=spdfit(x, upper=0.9, lower=0.1)
##D ## rspd  -
##D    par(mfrow = c(2, 2), cex = 0.7)
##D    r = rspd(n = 1000, fit)
##D    hist(r, n = 100, probability = TRUE, xlab = "r", 
##D    col = "steelblue", border = "white",main = "Density")
##D    box()
##D ## dspd -
##D    # Plot empirical density and compare with true density:
##D    r = rspd(n = 1000, fit)
##D    hist(r, n = 100, probability = TRUE, xlab = "r", 
##D    col = "steelblue", border = "white",main = "Density")
##D    box()
##D    x = seq(-0.3, 0.3, length.out = 1000)
##D    lines(x, dspd(x, fit), col = "darkorange",lwd=2)
##D    
##D ## pspd -
##D    # Plot df and compare with true df:
##D    plot(sort(r), (1:length(r)/length(r)), 
##D    ylim = c(0, 1), pch = 19, 
##D    cex = 0.5, ylab = "p", xlab = "q", main = "CDF")
##D    grid()
##D    q = seq(-0.3, 0.3, length.out = 1000)
##D    lines(q, pspd(q, fit), col = "darkorange",lwd=2)
## End(Not run)


