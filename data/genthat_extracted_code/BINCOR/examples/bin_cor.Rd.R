library(BINCOR)


### Name: bin_cor
### Title: Binned correlation
### Aliases: bin_cor bin_cor
### Keywords: bincor Binned correlation bin_cor

### ** Examples

 #####################################################################
 #::  Figure 1 D (Polanco-Martínez et al. (2018), (mimeo)). 
 #####################################################################
 library("BINCOR") 

 #####################################################################
 #:: Loading the time series under analysis: example 1 (ENSO vs. NHSST) 
 #####################################################################
 data(ENSO) 
 data(NHSST)

 #####################################################################
 # Testing our bin_cor function
 #####################################################################
 bincor.tmp    <- bin_cor(ENSO.dat, NHSST.dat, FLAGTAU=3, "output_ENSO_NHSST.tmp")
 binnedts      <- bincor.tmp$Binned_time_series



