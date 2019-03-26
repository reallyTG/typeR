library(lmomco)


### Name: fpds2f
### Title: Conversion of Partial-Duration Nonexceedance Probability to
###   Annual Nonexceedance Probability
### Aliases: fpds2f
### Keywords: utility (probability)

### ** Examples

## Not run: 
##D stream <- "A Stream in West Texas"
##D Qpds    <- c(61.8, 122, 47.3, 71.1, 211, 139, 244, 111, 233, 102)
##D Qann <- c(61.8, 122, 71.1, 211, 244, 0, 233)
##D years  <- length(Qann)  # gage has operated for about 7 years
##D visits <- 27  # number of visits or "events"
##D rate   <- visits/years
##D Z <- rep(0, visits-length(Qpds))
##D Qpds <- c(Qpds,Z) # The creation of a partial duration series
##D # that will contain numerous zero values.
##D 
##D Fs <- seq(0.001,.999, by=.005) # used to generate curves
##D 
##D type <- "pe3" # The Pearson type III distribution
##D PPpds <- pp(Qpds); Qpds <- sort(Qpds) # plotting positions (partials)
##D PPann <- pp(Qann); Qann <- sort(Qann) # plotting positions (annuals)
##D parann <- lmom2par(lmoms(Qann), type=type) # parameter estimation (annuals)
##D parpsd <- lmom2par(lmoms(Qpds), type=type) # parameter estimation (partials)
##D 
##D Fsplot    <- qnorm(Fs) # in order to produce normal probability paper
##D PPpdsplot <- qnorm(fpds2f(PPpds, rate=rate)) # ditto
##D PPannplot <- qnorm(PPann) # ditto
##D 
##D # There are many zero values in this particular data set that require leaving
##D # them out in order to achieve appropriate curvature of the Pearson type III
##D # distribution. Conditional probability adjustments will be used.
##D Qlo <- x2xlo(Qpds) # Create a left out object with an implied threshold of zero
##D parlo <- lmom2par(lmoms(Qlo$xin), type=type) # parameter estimation for the
##D # partial duration series values that are greater than the threshold, which
##D # defaults to zero.
##D 
##D plot(PPpdsplot, Qpds, type="n", ylim=c(0,400), xlim=qnorm(c(.01,.99)),
##D      xlab="STANDARD NORMAL VARIATE", ylab="DISCHARGE, IN CUBIC FEET PER SECOND")
##D mtext(stream)
##D points(PPannplot, Qann, col=3, cex=2, lwd=2, pch=0)
##D points(qnorm(fpds2f(PPpds, rate=rate)), Qpds, pch=16, cex=0.5 )
##D points(qnorm(fpds2f(flo2f(pp(Qlo$xin), pp=Qlo$pp), rate=rate)),
##D        sort(Qlo$xin), col=2, lwd=2, cex=1.5, pch=1)
##D points(qnorm(fpds2f(Qlo$ppout, rate=rate)),
##D        Qlo$xout, pch=4, col=4)
##D 
##D lines(qnorm(fpds2f(Fs, rate=rate)),
##D       qlmomco(Fs, parpsd), lwd=1, lty=2)
##D lines(Fsplot, qlmomco(Fs, parann), col=3, lwd=2)
##D lines(qnorm(fpds2f(flo2f(Fs, pp=Qlo$pp), rate=rate)),
##D       qlmomco(Fs, parlo), col=2, lwd=3)
##D 
##D # The following represents a subtle application of the probability transform
##D # functions. The show how one starts with annual recurrence intervals
##D # converts into conventional annual nonexceedance probabilities as well as
##D # converting these to the partial duration nonexceedance probabilities.
##D Tann <- c(2, 5, 10, 25, 50, 100)
##D Fann <- T2prob(Tann); Gpds <- f2fpds(Fann, rate=rate)
##D FFpds <- qlmomco(f2flo(Gpds, pp=Qlo$pp), parlo)
##D FFann <- qlmomco(Fann, parann)
##D points(qnorm(Fann), FFpds, col=2, pch=16)
##D points(qnorm(Fann), FFann, col=3, pch=16)
##D 
##D legend(-2.4,400, c("True annual series (with one zero year)",
##D                 "Partial duration series (including 'visits' as 'events')",
##D                 "Partial duration series (after conditional adjustment)",
##D                 "Left-out values (<= zero) (trigger of conditional probability)",
##D                 "PE3 partial-duration frequency curve (PE3-PDS)",
##D                 "PE3 annual-series frequency curve (PE3-ANN)",
##D                 "PE3 partial-duration frequency curve (zeros removed) (PE3-PDSz)",
##D                 "PE3-ANN  T-year event: 2, 5, 10, 25, 50, 100 years",
##D                 "PE3-PDSz T-year event: 2, 5, 10, 25, 50, 100 years"),
##D        bty="n", cex=.75,
##D        pch=c(0,  16, 1, 4, NA, NA, NA, 16, 16),
##D        col=c(3,  1, 2,  4,  1,  3,  2,  3, 2),
##D        pt.lwd=c(2,1,2,1), pt.cex=c(2, 0.5, 1.5, 1, NA, NA, NA, 1, 1),
##D        lwd=c(0,0,0,0,1,2,3), lty=c(0,0,0,0,2,1,1))
## End(Not run)



