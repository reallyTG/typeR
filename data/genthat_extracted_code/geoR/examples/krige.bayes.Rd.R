library(geoR)


### Name: krige.bayes
### Title: Bayesian Analysis for Gaussian Geostatistical Models
### Aliases: krige.bayes model.control prior.control post2prior
###   print.krige.bayes print.posterior.krige.bayes
### Keywords: spatial models

### ** Examples

## Not run: 
##D # generating a simulated data-set
##D ex.data <- grf(70, cov.pars=c(10, .15), cov.model="matern", kappa=2)
##D #
##D # defining the grid of prediction locations:
##D ex.grid <- as.matrix(expand.grid(seq(0,1,l=21), seq(0,1,l=21)))
##D #
##D # computing posterior and predictive distributions
##D # (warning: the next command can be time demanding)
##D ex.bayes <- krige.bayes(ex.data, loc=ex.grid,
##D                  model = model.control(cov.m="matern", kappa=2),
##D                  prior = prior.control(phi.discrete=seq(0, 0.7, l=51),
##D                              phi.prior="reciprocal"))
##D #
##D # Prior and posterior for the parameter phi
##D plot(ex.bayes, type="h", tausq.rel = FALSE, col=c("red", "blue"))
##D #
##D # Plot histograms with samples from the posterior
##D par(mfrow=c(3,1))
##D hist(ex.bayes)
##D par(mfrow=c(1,1))
##D 
##D # Plotting empirical variograms and some Bayesian estimates:
##D # Empirical variogram
##D plot(variog(ex.data, max.dist = 1), ylim=c(0, 15))
##D # Since ex.data is a simulated data we can plot the line with the "true" model 
##D lines.variomodel(ex.data, lwd=2)
##D # adding lines with summaries of the posterior of the binned variogram
##D lines(ex.bayes, summ = mean, lwd=1, lty=2)
##D lines(ex.bayes, summ = median, lwd=2, lty=2)
##D # adding line with summary of the posterior of the parameters
##D lines(ex.bayes, summary = "mode", post = "parameters")
##D 
##D # Plotting again the empirical variogram
##D plot(variog(ex.data, max.dist=1), ylim=c(0, 15))
##D # and adding lines with median and quantiles estimates
##D my.summary <- function(x){quantile(x, prob = c(0.05, 0.5, 0.95))}
##D lines(ex.bayes, summ = my.summary, ty="l", lty=c(2,1,2), col=1)
##D 
##D # Plotting some prediction results
##D op <- par(no.readonly = TRUE)
##D par(mfrow=c(2,2), mar=c(4,4,2.5,0.5), mgp = c(2,1,0))
##D image(ex.bayes, main="predicted values")
##D image(ex.bayes, val="variance", main="prediction variance")
##D image(ex.bayes, val= "simulation", number.col=1,
##D       main="a simulation from the \npredictive distribution")
##D image(ex.bayes, val= "simulation", number.col=2,
##D       main="another simulation from \nthe predictive distribution")
##D #
##D par(op)
## End(Not run)
##
## For a extended list of exemples of the usage of krige.bayes()
## see http://www.leg.ufpr.br/geoR/tutorials/examples.krige.bayes.R
##




