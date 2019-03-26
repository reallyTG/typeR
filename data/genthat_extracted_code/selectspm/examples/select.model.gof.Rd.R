library(selectspm)


### Name: select.model.gof
### Title: Fit and Select Point Pattern Models Based on Minimum Contrast
###   and Goodness of Fit
### Aliases: select.model.gof envelope.selectedmodgof
###   simulate.selectedmodgof plot.selectedmodgof print.selectedmodgof
### Keywords: spatial

### ** Examples

## Not run: 
##D # Get the data
##D data(teucrium)
##D 
##D # Define the sequence of r's at which estimate K(r)
##D   r<-seq(0,1.5, by=0.01)
##D 
##D # Define different standard deviations for the Gaussian kernel 
##D # to estimate different intensity surfaces
##D  sigmas <- seq(0.5, 3.5, by=0.25)
##D 
##D 
##D 
##D # Fit 28 models (1 Poisson, 1 Poisson cluster, 13 inhomogeneous Poisson
##D #  and 13 inhomogeneous Poisson cluster)  to  teucrium and select the better ones
##D 
##D teucrium.model <- select.model.gof(teucrium, sigmas=sigmas, r=r)
##D 
##D teucrium.model 
##D 
##D # Show the empirical K function, 
##D #  and the envelopes based on this model
##D 
##D  plot( teucrium.model, sqrt(./pi)-r~r, legend=F, ylab="L(r)", las=1)
##D 
##D 
##D # Compute and plot envelopes for the pcf function according to the best fitted model.
##D 
##D teucrium.env <- envelope(teucrium.model, fun=pcf,  nsim=19)
##D plot(teucrium.env, legend=F)
##D 
##D # simulate 10 point patterns according to the best fitted model
##D 
##D teucrium.simu <- simulate(teucrium.model, nsim=10)
##D 
##D teucrium.simu
##D 
##D 
## End(Not run)



