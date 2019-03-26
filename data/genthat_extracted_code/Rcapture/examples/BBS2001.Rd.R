library(Rcapture)


### Name: BBS2001
### Title: Species Richness Data from the North American Breeding Bird
###   Survey (BBS) in 2001
### Aliases: BBS2001
### Keywords: datasets

### ** Examples

data(BBS2001)
desc <- descriptive(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50)
plot(desc)
   # Note in this plot the convex shape typical of model Mh.

cp <- closedp.0(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20)
cp
plot(cp)
   # The Gamma estimator has the smallest deviance and all 
   # its residuals are small.
   
   # Let's calculate a profile confidence interval for the gamma 
   # estimator:
closedpCI.0(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20,
            m = "Mh", h = "Gamma", h.control = list(theta = 3.5))		

   # One can also calculate a profile confidence interval for Chao's 
   # lower bound:
closedpCI.0(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20,
            m = "Mh", h = "Chao")   



