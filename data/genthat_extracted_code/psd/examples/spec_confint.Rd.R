library(psd)


### Name: spec_confint
### Title: Confidence intervals for multitaper power spectral density
###   estimates
### Aliases: spec_confint spec_confint.default spec_confint.spec
###   spec_confint.tapers

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Confidence intervals from taper numbers
##D ##
##D 
##D sp <- spectral_properties(as.tapers(1:50), p=0.95, db.ci=TRUE)
##D 
##D # standard errors as a function of tapers
##D par(las=1)
##D plot(stderr.chi.upper ~ taper, sp, type="s",
##D        ylim=c(-10,20), yaxs="i", xaxs="i",
##D        xlab=expression("number of tapers ("* nu/2 *")"), ylab="dB",
##D        main="Spectral uncertainties")
##D mtext("(additive factor)", line=.3)
##D lines(stderr.chi.lower ~ taper, sp, type="s")
##D lines(stderr.chi.median ~ taper, sp, type="s", lwd=2)
##D lines(stderr.chi.approx ~ taper, sp, type="s", col="red",lwd=2)
##D # indicate K needed to reach 3 dB wide confidence interval (p=.95)
##D abline(v=33, lty=3)
##D legend("topright",
##D         c(expression("Based on "* chi^2 *"(p,"*nu*") and (1-p,"*nu*")"),
##D           expression(""* chi^2 *"(p=0.5,"*nu*")"),
##D           "approximation"),
##D        lwd=c(1,3,3),
##D        col=c("black","black","red"),
##D        bg="grey98")
##D 
## End(Not run)#REX



