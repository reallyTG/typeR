library(BINCOR)


### Name: cor_ts
### Title: Bi-variate correlation
### Aliases: cor_ts cor_ts
### Keywords: cor_ts Bi-variate correlation Correlation

### ** Examples

 #####################################################################
 #::  Figure 2 (Polanco-Martínez et al. (2018), (mimeo)). 
 #####################################################################
 library("BINCOR")  
 library("pracma")

 #####################################################################
 #:: Loading the time series under analysis: example 1 (ENSO vs. NHSST) 
 #####################################################################
 data(ENSO) 
 data(NHSST)

 #####################################################################
 # Computing the binned time series though our bin_cor function 
 #####################################################################
 bincor.tmp    <- bin_cor(ENSO.dat, NHSST.dat, FLAGTAU=3, "output_ENSO_NHSST.tmp")
 binnedts      <- bincor.tmp$Binned_time_series

 #####################################################################
 # Testing our cor_ts function: cor_ts.R
 #####################################################################
 # screen (scatterplot) and Pearson  
 cor_ts(binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", "SST NH Mean", 
  KoCM="pearson", rmltrd="y") 

 # PDF format (scatterplot) and Kendall 
 cor_ts(binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", "SST NH Mean", 
  KoCM="kendall", rmltrd="y", device="pdf", Hpdf=6, Wpdf=9, resfig=300, 
  ofilename="scatterplot_ENSO_SST") 

 # JPG format (scatterplot) and Spearman  
 cor_ts( binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", "SST NH Mean", 
  KoCM="spearman", rmltrd="y", device="jpg", Hfig=900, Wfig=1200, 
  resfig=150, ofilename="scatterplot_ENSO_SST") 



