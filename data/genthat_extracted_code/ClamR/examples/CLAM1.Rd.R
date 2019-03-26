library(ClamR)


### Name: CLAM1
### Title: Clam Proxy Data
### Aliases: CLAM1
### Keywords: datasets

### ** Examples

data(CLAM1)
## maybe str(CLAM1) ; plot(CLAM1) ...
plot(CLAM1$x, CLAM1$y, type="b", xlab="Distance", ylab="d18O" )

## Not run: 
##D ###### this is an example from Wang et al.:
##D ####  it takes too long to run on CRAN, but should work
##D 
##D shellx=CLAM1$x[38:70]
##D shelly=CLAM1$y[38:70]
##D 
##D window_shell=windowsize(shellx,shelly,1.8,9.4,0.2)
##D 
##D #the window size is 5mm, and make all the plots together
##D gout_shell = proxyJK(shellx, shelly, 5)
##D 
##D par(mfrow=c(3,2))
##D plot(shellx,shelly,type="b", xlab="Distance from Margin (mm)",
##D      ylab=expression(delta*"18O(ppm VPDB)"),  
##D      xlim=c(4,10), ylim = c(1.5,4))
##D plot((window_shell$win)/2,window_shell$error,xlab="Window Size (mm)", 
##D      ylab="Error",  xlim=c(1.6/2,9.4/2), ylim=c(0,0.5))
##D abline(v=4.63/2, lty="dotdash",col="black")
##D abline(v=5/2, col="black")
##D plotproxy1(shellx, shelly, gout_shell, xlim=c(4,10), ylim = c(1.5,4),
##D           xlab="Distance from Margin (mm)",
##D           ylab=expression(delta*"18O(ppm VPDB)"), main="")
##D plotproxy.all(gout_shell,YAXstyle=1, xlim=c(4,10), ylim1=c(0,4), 
##D              ylim2=c(-15,5))
##D plotproxy.error(shellx, shelly, gout_shell, type = 1, xlim=c(4,10), 
##D                ylim = c(1.5,4), xlab="Distance from Margin (mm)",
##D                ylab=expression(delta*"18O(ppm VPDB)"))
##D plotproxy.error(shellx, shelly, gout_shell, type = 2, xlim=c(4,10),
##D                ylim = c(1.5,4), xlab="Distance from Margin (mm)",
##D                ylab=expression(delta*"18O(ppm VPDB)"))
##D 
##D 
##D 
## End(Not run)




