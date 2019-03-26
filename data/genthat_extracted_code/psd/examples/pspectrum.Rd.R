library(psd)


### Name: pspectrum
### Title: Adaptive sine multitaper power spectral density estimation
### Aliases: adapt_message pspectrum pspectrum.default pspectrum.spec
###   pspectrum.ts pspectrum_basic

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D library(RColorBrewer)
##D 
##D ##
##D ## Adaptive multitaper PSD estimation
##D ## (see also the  "psd_overview"  vignette)
##D ##
##D 
##D data(magnet)
##D Xr <- magnet$raw
##D Xc <- magnet$clean
##D 
##D # adaptive psd estimation (turn off diagnostic plot)
##D PSDr <- pspectrum(Xr, plot=FALSE)
##D PSDc <- pspectrum(Xc, plot=FALSE)
##D 
##D # plot them on the same scale
##D plot(PSDc, log="dB",
##D      main="Raw and cleaned Project MAGNET power spectral density estimates",
##D      lwd=3, ci.col=NA, ylim=c(0,32), yaxs="i")
##D plot(PSDr, log="dB", add=TRUE, lwd=3, lty=5)
##D text(c(0.25,0.34), c(11,24), c("Clean","Raw"), cex=1)
##D 
##D ## Change sampling, and inspect the diagnostic plot
##D plot(pspectrum(Xc, niter=1, x.frqsamp=10, plot=TRUE))
##D 
##D ## Say we forgot to assign the results: we can recover from the environment with:
##D PSDc_recovered <- psd_envGet("final_psd")
##D plot(PSDc_recovered)
##D 
## End(Not run)#REX



