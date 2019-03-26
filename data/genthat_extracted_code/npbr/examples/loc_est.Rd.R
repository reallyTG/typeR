library(npbr)


### Name: loc_est
### Title: Local linear frontier estimator
### Aliases: loc_est
### Keywords: optimize

### ** Examples

data("nuclear")
x.nucl <- seq(min(nuclear$xtab), max(nuclear$xtab), 
 length.out=101) 
# 1. Unconstrained estimator
# Optimal bandwidths over 100 bootstrap replications
## Not run: 
##D h.nucl.u <- loc_est_bw(nuclear$xtab, nuclear$ytab, 
##D  x.nucl, h=40, B=100, method="u")
## End(Not run)
(h.nucl.u<-79.11877)
y.nucl.u<-loc_est(nuclear$xtab, nuclear$ytab, x.nucl, 
 h=h.nucl.u, method="u")

# 2. improved version of the estimator
# Optimal bandwidths over 100 bootstrap replications
## Not run: 
##D  
##D h.nucl.m <- loc_est_bw(nuclear$xtab, nuclear$ytab, 
##D  x.nucl, h=40, B=100, method="m")
## End(Not run) 
(h.nucl.m<-79.12)
y.nucl.m<-loc_est(nuclear$xtab, nuclear$ytab, x.nucl, 
 h=h.nucl.m, method="m") 

# 3. Representation 
plot(x.nucl, y.nucl.u, lty=1, lwd=4, col="magenta", type="l")
lines(x.nucl, y.nucl.m, lty=2, lwd=4, col="cyan") 
points(ytab~xtab, data=nuclear)
legend("topleft",legend=c("unconstrained", "improved"), 
 col=c("magenta","cyan"), lwd=4, lty=c(1,2))



