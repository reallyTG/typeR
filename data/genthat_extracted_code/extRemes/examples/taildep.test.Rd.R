library(extRemes)


### Name: taildep.test
### Title: Tail Dependence Test
### Aliases: taildep.test relative.rank
### Keywords: htest multivariate

### ** Examples

x <- arima.sim(n = 63, list(ar = c(0.8897, -0.4858), ma = c(-0.2279, 0.2488)),
               sd = sqrt(0.1796))

y <- x + rnorm(63)

taildep.test(x, y)

# Recall that null hypothesis is tail dependence!

## Not run: 
##D data(PORTw)
##D taildep.test(PORTw$TMX1, PORTw$TMN0, cthresh=-0.3)
##D 
##D data(FCwx)
##D taildep.test(FCwx$MxT, FCwx$Prec, cthresh=-0.4)
##D 
##D # Run the example (13.3.6) in Reiss and Thomas (2007)
##D # using the 'wavesurge' dataset from package 'ismev'.
##D data(wavesurge)
##D cth <- seq(-0.46,-0.35,0.01)
##D tab13.1 <- matrix(NA, 2, 12)
##D colnames(tab13.1) <- as.character(cth)
##D for(i in 1:12) {
##D     tmp <- taildep.test(wavesurge, cthresh=cth[i], ties.method="max")
##D     tab13.1[1,i] <- tmp$parameter["m"]
##D     tab13.1[2,i] <- tmp$p.value
##D } # end of for 'i' loop.
##D 
##D rownames(tab13.1) <- c("m", "p-value")
##D tab13.1
## End(Not run)




