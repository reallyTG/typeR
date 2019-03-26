library(bReeze)


### Name: pc
### Title: Import power curve from file
### Aliases: pc pc.default pc.read plot.pc
### Keywords: methods

### ** Examples

## Not run: 
##D ## create power curve
##D # minimal theoretic power curve
##D pc.1 <- pc(list(1:25, c(0, 0, seq(0,1000,length.out=8), rep(1000,15))))
##D pc.1
##D 	
##D # detailed power curve
##D v <- seq(3, 25, 0.5)
##D p <- c(5, 15.5, 32, 52, 71, 98, 136, 182, 230, 285, 345, 419, 497, 594, 
##D   687, 760, 815, 860, 886, rep(900, 26))	
##D cp <- c(0.263, NA, 0.352, NA, 0.423, NA, 0.453, NA, 0.470, NA, 0.478, 
##D   NA, 0.480, NA, 0.483, NA, 0.470, NA, 0.429, NA, 0.381, NA, 0.329, 
##D   NA, 0.281, NA, 0.236, NA, 0.199, NA, 0.168, NA, 0.142, NA, 0.122, 
##D   NA, 0.105, NA, 0.092, NA, 0.080, NA, 0.071, NA, 0.063)
##D ct <- c(0.653, NA, 0.698, NA, 0.705, NA, 0.713, NA, 0.720, NA, 0.723, NA, 
##D   0.724, NA, 0.727, NA, 0.730, NA, 0.732, NA, 0.385, NA, 0.301, NA, 0.242, 
##D   NA, 0.199, NA, 0.168, NA, 0.146, NA, 0.128, NA, 0.115, NA, 0.103, NA, 
##D   0.094, NA, 0.086, NA, 0.079, NA, 0.073)	
##D 
##D # variables as list
##D pc.2 <- pc(list(v=v, p=p, cp=cp, ct=ct), 
##D   rho=1.195, rated.p=900, desc="PowerWind 56")
##D pc.2
##D 
##D # variables as data frame
##D pc.3 <- pc(data.frame(v=v, p=p, cp=cp, ct=ct), 
##D   rho=1.195, rated.p=900, desc="PowerWind 56")
##D pc.3
##D 
##D ## import power curve
##D ## note: XML package required for WAsP .wtg files
##D vestas.v90 <- pc("Vestas_V90_2.0MW.wtg")  # bReeze wtg file
##D repower.mm92 <- pc("Repower_MM92_2.0MW.pow")  # bReeze pow file
##D #my.pc <- pc("~/Projects/bReeze/Sandbox/myPC.wtg")  # user file
##D 
##D 
##D ## plot power curve
##D plot(pc.2)  # default
##D plot(pc.2, cp=FALSE, ct=FALSE)  # drop coefficients
##D 
##D # customize plot
##D plot(pc.2, bty="u", bty.leg="o", cex.axis=0.8, cex.lab=0.9, 
##D   cex.leg=0.7, col=c("red", gray(0.4), gray(0.4)), col.axis=gray(0.2), 
##D   col.box=gray(0.5), col.lab=gray(0.2), col.leg=gray(0.2), 
##D   col.ticks=gray(0.5), las=2, leg.text=c("electric Power", 
##D   "power coefficient", "thrust coefficient"), lty=2:4, lwd=c(2,1,1), 
##D   mar=c(3.5,3.5,0.5,3.5), mgp=c(1.8,0.6,0), pos.leg="top", 
##D   xlab="velocity [m/s]", ylab=c("electric power", "coefficients"), 
##D   ylim=c(0,1100), x.intersp=1, y.intersp=1)
## End(Not run)



