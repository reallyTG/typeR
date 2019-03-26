library(psd)


### Name: spectral_properties
### Title: Calculate properties of multitaper power spectral density
###   estimates
### Aliases: spectral_properties spectral_properties.default
###   spectral_properties.spec spectral_properties.tapers

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Spectral properties from the number of tapers used
##D ## (portions extracted from overview vignette)
##D ##
##D 
##D #
##D # Theoretical uncertainties from Chi^2 distribution
##D #
##D sp <- spectral_properties(as.tapers(1:50), p=0.95, db.ci=TRUE)
##D par(las=1)
##D plot(stderr.chi.upper ~ taper, sp, type="s",
##D        ylim=c(-10,20), yaxs="i", xaxs="i",
##D        xlab=expression("number of tapers ("* nu/2 *")"), ylab="dB",
##D        main="Spectral uncertainties")
##D lines(stderr.chi.lower ~ taper, sp, type="s")
##D lines(stderr.chi.median ~ taper, sp, type="s", lwd=2)
##D lines(stderr.chi.approx ~ taper, sp, type="s", col="red",lwd=2)
##D 
##D #
##D # An example using the Project MAGNET dataset
##D #
##D data(magnet)
##D tapinit <- 15 # tapers
##D dt <- 1 # 1/km
##D 
##D # remove mean/trend (not really necessary but good practice; also, done internally)
##D ats <- prewhiten(ts(magnet$clean, deltat=dt), plot=FALSE)$prew_lm
##D 
##D # normal and adaptive multitaper spectra
##D Pspec <- psdcore(ats, dt, tapinit)
##D Aspec <- pspectrum(ats, dt, tapinit, niter=3, plot=FALSE)
##D 
##D # calculate spectral properties
##D spp <- spectral_properties(Pspec$taper, db.ci=TRUE)
##D spa <- spectral_properties(Aspec$taper, db.ci=TRUE)
##D 
##D # function to create polygon data, and create them
##D pspp <- create_poly(Pspec$freq, dB(Pspec$spec), spp$stderr.chi.approx)
##D psppu <- create_poly(Pspec$freq, dB(Pspec$spec), spp$stderr.chi.upper)
##D pspa <- create_poly(Aspec$freq, dB(Aspec$spec), spa$stderr.chi.approx)
##D pspau <- create_poly(Aspec$freq, dB(Aspec$spec), spa$stderr.chi.upper)
##D 
##D ##
##D ## Project MAGNET uncertainties
##D ##
##D plot(c(0,0.5),c(-8,35),col="white",
##D        main="Project MAGNET Spectral Uncertainty (p > 0.95)",
##D        ylab="", xlab="spatial frequency, 1/km", yaxt="n", frame.plot=FALSE)
##D lines(c(2,1,1,2)*0.01,c(5,5,8.01,8.01)-8)
##D text(.05, -1.4, "3.01 dB")
##D polygon(psppu$xx, (psppu$yy), col="light grey", border="black", lwd=0.5)
##D polygon(pspp$xx, (pspp$yy), col="dark grey", border=NA)
##D text(0.15, 6, "With adaptive\ntaper refinement", cex=1.2)
##D polygon(pspau$xx, (pspau$yy)-10, col="light grey", border="black", lwd=0.5)
##D polygon(pspa$xx, (pspa$yy)-10, col="dark grey", border=NA)
##D text(0.35, 22, "Uniform tapering", cex=1.2)
##D 
##D ##
##D ## Project MAGNET resolution
##D ##
##D frq <- Aspec$freq
##D relp <- dB(1/spa$resolution)
##D par(las=1)
##D plot(frq, relp,
##D      col="light grey",
##D      ylim=dB(c(1,5)),
##D      type="h", xaxs="i", yaxs="i",
##D      ylab="dB", xlab="frequency, 1/km",
##D      main="Project MAGNET Spectral Resolution and Uncertainty")
##D lines(frq, relp)
##D lines(frq, spp$stderr.chi.upper+relp, lwd=1.5, lty=3)
##D lines(frq, spa$stderr.chi.upper+relp, lwd=3, lty=2)
##D abline(h=dB(sqrt(vardiff(Aspec$spec))), lwd=1.5, lty=2, col="red")
##D 
##D ##
## End(Not run)#REX



