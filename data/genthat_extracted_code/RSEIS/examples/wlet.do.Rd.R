library(RSEIS)


### Name: wlet.do
### Title: Return Wavelet transform
### Aliases: wlet.do
### Keywords: misc hplot

### ** Examples

## Not run: 
##D data(CE1)
##D 
##D plot(CE1$x, CE1$y, type='l')
##D 
##D require(Rwave)
##D 
##D out <- wlet.do(CE1$y, CE1$dt, flip = FALSE, ploty = TRUE)
##D 
##D 
##D ####  show with different scalings:
##D plotwlet(out$baha, CE1$y, CE1$dt , zscale=3,
##D col=rainbow(100) ,  ygrid=FALSE)
##D 
##D plotwlet(out$baha, CE1$y, CE1$dt , zscale=1,  col=terrain.colors(100) ,
##D ygrid=TRUE)
##D 
##D ##############  add frequency scale on the right hand side of image
##D pfreqs <- c(0.5, 1, 2,3,4,5, 10, 14)
##D 
##D  zp <- pwlet2freqs(noctave=out$baha$noctave , nvoice=out$baha$nvoice,
##D      CE1$dt,
##D      flip = TRUE, pfreqs, plot = TRUE,
##D      perc = 0.85)
##D 
##D 
##D 
##D 
## End(Not run)




