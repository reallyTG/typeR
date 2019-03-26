library(Rcapture)


### Name: ill
### Title: Illegal immigrants in the Netherlands
### Aliases: ill
### Keywords: datasets

### ** Examples

data(ill)

sdesc <- descriptive(ill, dtype = "nbcap", dfreq = TRUE, t = Inf)
plot(sdesc)
   # A mixture model looks appropriate

closedp.0(ill, dtype = "nbcap", dfreq = TRUE, t = Inf)

   # We can try to fit a normal mixture model:
closedpCI.0(ill, dtype = "nbcap", dfreq = TRUE, t = Inf, m = "Mh", h = "Normal")
   # We get an estimate similar to the Mh Gamma3.5 estimate.

   # Estimates are highly variable and it seems difficult to come up with a
   # definitive answer. The lower bound estimate is useful in this context.
closedpCI.0(ill, dtype = "nbcap", dfreq = TRUE, t = Inf, m = "Mh", h = "LB")
   # Considering the lower limit of a 95% confidence estimate for the lower bound, 
   # there should be at least 8 000 illegal immigrants in the Netherlands. 
   # Less than 25% have been caught.



