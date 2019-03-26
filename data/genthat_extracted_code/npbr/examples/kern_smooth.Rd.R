library(npbr)


### Name: kern_smooth
### Title: Frontier estimation via kernel smoothing
### Aliases: kern_smooth
### Keywords: optimize

### ** Examples

## Not run: 
##D data("green")
##D x.green <- seq(min(log(green$COST)), max(log(green$COST)), 
##D  length.out = 101)
##D options(np.tree=TRUE, crs.messages=FALSE, np.messages=FALSE)
##D # 1. Unconstrained 
##D (h.bic.green.u <- kern_smooth_bw(log(green$COST), 
##D  log(green$OUTPUT), method = "u", technique = "noh", 
##D  bw_method = "bic"))
##D y.ks.green.u <- kern_smooth(log(green$COST), 
##D  log(green$OUTPUT), x.green, h = h.bic.green.u, 
##D  method = "u", technique = "noh")
##D 
##D # 2. Monotonicity constraint
##D (h.bic.green.m <- kern_smooth_bw(log(green$COST),
##D  log(green$OUTPUT), method = "m", technique = "noh",
##D  bw_method = "bic"))
##D y.ks.green.m <- kern_smooth(log(green$COST), 
##D  log(green$OUTPUT), x.green, h = h.bic.green.m, 
##D  method = "m", technique = "noh")
##D 
##D # 3. Monotonicity and Concavity constraints
##D (h.bic.green.mc<-kern_smooth_bw(log(green$COST), log(green$OUTPUT), 
##D  method="mc", technique="noh", bw_method="bic"))
##D y.ks.green.mc<-kern_smooth(log(green$COST), 
##D  log(green$OUTPUT), x.green, h=h.bic.green.mc, method="mc", 
##D  technique="noh")
##D 
##D # Representation 
##D plot(log(OUTPUT)~log(COST), data=green, xlab="log(COST)", 
##D  ylab="log(OUTPUT)") 
##D lines(x.green, y.ks.green.u, lty=1, lwd=4, col="green")
##D lines(x.green, y.ks.green.m, lty=2, lwd=4, col="cyan")
##D lines(x.green, y.ks.green.mc, lty=3, lwd=4, col="magenta")   
##D legend("topleft", col=c("green","cyan","magenta"), 
##D lty=c(1,2,3), legend=c("unconstrained", "monotone", 
##D  "monotone + concave"), lwd=4, cex=0.8)
## End(Not run)    



