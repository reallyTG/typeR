library(lmomco)


### Name: theoLmoms.max.ostat
### Title: Compute the Theoretical L-moments of a Distribution Distribution
###   based on System of Maximum Order Statistic Expectations
### Aliases: theoLmoms.max.ostat theoLmoms.min.ostat
### Keywords: L-moment (theoretical) order statistics (misc.)

### ** Examples

## Not run: 
##D para <- vec2par(c(40,20), type='nor')
##D A1 <- theoLmoms.max.ostat(para=para, cdf=cdfnor, pdf=pdfnor, switch2minostat=FALSE)
##D A2 <- theoLmoms.max.ostat(para=para, cdf=cdfnor, pdf=pdfnor, switch2minostat=TRUE)
##D B1 <- theoLmoms.max.ostat(para=para, qua=quanor, switch2minostat=FALSE)
##D B2 <- theoLmoms.max.ostat(para=para, qua=quanor, switch2minostat=TRUE)
##D print(A1$ratios[4]) # reports 0.1226017
##D print(A2$ratios[4]) # reports 0.1226017
##D print(B1$ratios[4]) # reports 0.1226012
##D print(B2$ratios[4]) # reports 0.1226012
##D # Theoretical value = 0.122601719540891.
##D # Confirm operational with native R-code being used inside lmomco functions
##D # Symmetrically correct on whether minima or maxima are used, but some
##D # Slight change when qnorm() used instead of dnorm() and pnorm().
##D 
##D para <- vec2par(c(40,20), type='exp')
##D A1 <- theoLmoms.max.ostat(para=para, cdf=cdfexp, pdf=pdfexp, switch2minostat=FALSE)
##D A2 <- theoLmoms.max.ostat(para=para, cdf=cdfexp, pdf=pdfexp, switch2minostat=TRUE)
##D B1 <- theoLmoms.max.ostat(para=para, qua=quaexp, switch2minostat=FALSE)
##D B2 <- theoLmoms.max.ostat(para=para, qua=quaexp, switch2minostat=TRUE)
##D print(A1$ratios[4]) # 0.1666089
##D print(A2$ratios[4]) # 0.1666209
##D print(B1$ratios[4]) # 0.1666667
##D print(B2$ratios[4]) # 0.1666646
##D # Theoretical value = 0.1666667
##D 
##D para <- vec2par(c(40,20), type='ray')
##D A1 <- theoLmoms.max.ostat(para=para, cdf=cdfray, pdf=pdfray, switch2minostat=FALSE)
##D A2 <- theoLmoms.max.ostat(para=para, cdf=cdfray, pdf=pdfray, switch2minostat=TRUE)
##D B1 <- theoLmoms.max.ostat(para=para, qua=quaray, switch2minostat=FALSE)
##D B2 <- theoLmoms.max.ostat(para=para, qua=quaray, switch2minostat=TRUE)
##D print(A1$ratios[4]) # 0.1053695
##D print(A2$ratios[4]) # 0.1053695
##D print(B1$ratios[4]) # 0.1053636
##D print(B2$ratios[4]) # 0.1053743
##D # Theoretical value = 0.1053695
## End(Not run)
## Not run: 
##D # The Rice distribution is complex and tailoring of the integration
##D # limits is needed to effectively trap errors, the limits for the
##D # Normal distribution above are infinite so no granular control is needed.
##D para <- vec2par(c(30,10), type="rice")
##D theoLmoms.max.ostat(para=para, cdf=cdfrice, pdf=pdfrice,
##D                     lower=0, upper=.Machine$double.max)
## End(Not run)
## Not run: 
##D para <- vec2par(c(0.6, 1.5), type="emu")
##D theoLmoms.min.ostat(para, cdf=cdfemu, pdf=pdfemu,
##D                     lower=0, upper=.Machine$double.max)
##D theoLmoms.min.ostat(para, cdf=cdfemu, pdf=pdfemu, yacoubsintegral = FALSE,
##D                     lower=0, upper=.Machine$double.max)
##D 
##D para <- vec2par(c(0.6, 1.5), type="kmu")
##D theoLmoms.min.ostat(para, cdf=cdfkmu, pdf=pdfkmu,
##D                     lower=0, upper=.Machine$double.max)
##D theoLmoms.min.ostat(para, cdf=cdfkmu, pdf=pdfkmu, marcumQ = FALSE,
##D                     lower=0, upper=.Machine$double.max)
## End(Not run)
## Not run: 
##D # The Normal distribution is used on the fly for the Rice for high to
##D # noise ratios (SNR=nu/alpha > some threshold). This example will error out.
##D nu <- 30; alpha <- 0.5
##D para <- vec2par(c(nu,alpha), type="rice")
##D theoLmoms.max.ostat(para=para, cdf=cdfrice, pdf=pdfrice,
##D                     lower=0, upper=.Machine$double.max)
## End(Not run)



