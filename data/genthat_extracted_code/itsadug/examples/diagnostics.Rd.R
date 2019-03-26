library(itsadug)


### Name: diagnostics
### Title: Visualization of the model fit for time series data.
### Aliases: diagnostics

### ** Examples


data(simdat)
## Not run: 
##D # no random smooths:
##D m1 <- bam(Y ~ Group + s(Time, by=Group) + s(Trial) + s(Subject, bs='re'), data=simdat)
##D diagnostics(m1)
##D 
##D # only plot residuals by predictor:
##D diagnostics(m1, plot=2)
##D 
##D # without prompts:
##D par(mfrow=c(2,2))
##D diagnostics(m1, plot=1:4, ask=FALSE)
##D 
##D # only plot random smooths:
##D diagnostics(m1, plot=5)
##D # Note: the plot does not change,
##D # because there are no random smooths to plot.
##D 
##D # with random smooths
##D m2 <- bam(Y ~ Group + s(Time, by=Group) + s(Time, Subject, bs='fs', m=1), data=simdat)  
##D diagnostics(m2)  
##D 
##D ## INSPECTION OF RANDOM SMOOTHS 
##D ## ----------------------------
##D 
##D # In this underspecified model (too much smoothing for the interaction)
##D # part of the effect of Time is captured by the random smooths:
##D m3 <- bam(Y ~ te(Time, Trial, k=c(3,3)) + s(Time, Subject, bs='fs', m=1), data=simdat) 
##D 
##D # The plot shows a clear trend in the average of the random smooths, 
##D # and the amplitude of the mean (!) curve is almost as large as the 
##D # amplitude of the 'fixed' effect of Time:
##D diagnostics(m3, plot=5, ask=FALSE)
##D 
##D # Compare with the following models:
##D m4 <- bam(Y ~ te(Time, Trial, k=c(10,5)) + s(Time, Subject, bs='fs', m=1), data=simdat) 
##D diagnostics(m4, plot=5, ask=FALSE)
##D 
##D m5 <- bam(Y ~ s(Time) + s(Trial) + ti(Time, Trial) 
##D     + s(Time, Subject, bs='fs', m=1), data=simdat) 
##D diagnostics(m5, plot=5, ask=FALSE)
##D 
## End(Not run)



