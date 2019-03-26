library(hht)


### Name: HHSpecPlot
### Title: Display Hilbert periodogram
### Aliases: HHSpecPlot
### Keywords: ts hplot

### ** Examples


#Here we see how the EMD produces a dyadic filter bank for uniform random noise
#The frequency distributions of all but the first IMF display a Chi-Square distribution
#See Huang, N. E. & Wu, Z. 
#A review on Hilbert-Huang Transform: Method and its applications to geophysical studies.
#Reviews of Geophysics, 2008, 46, RG2006

#The EMD of this signal may take a couple of minutes to run

set.seed(628)
sig  <-  runif(10000)
tt  <-  seq_len(length(sig)) * 0.01

## Not run: emd.result  <-  Sig2IMF(sig, tt)

dfreq  <-  0.1
## Not run: hspec  <-  HHSpectrum(emd.result, dfreq)

## Not run: 
##D HHSpecPlot(hspec, show.imfs = TRUE, 
##D imf.list = 1:10, show.total = TRUE, scaling = "sqrt", 
##D imf.lwd = rep(2, 10), total.lty = 3)
## End(Not run)



