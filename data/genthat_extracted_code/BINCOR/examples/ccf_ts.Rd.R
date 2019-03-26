library(BINCOR)


### Name: ccf_ts
### Title: Cross-correlation
### Aliases: ccf_ts ccf_ts
### Keywords: cor_ts Bi-variate correlation Correlation

### ** Examples

 #####################################################################
 #::  Figure 5 (Polanco-Martínez et al. (2018), (mimeo)). 
 #####################################################################
 library("BINCOR") 
 library("pracma")

 #####################################################################
 #:: Loading the time series under analysis: example 2 (pollen ACER)  
 #####################################################################
 data(MD04_2845_siteID31)
 data(MD95_2039_siteID32)

 #####################################################################
 # Computing the binned time series though our bin_cor function
 #####################################################################
 bincor.tmp <- bin_cor(ID31.dat, ID32.dat, FLAGTAU=3, "salida_ACER_ABRUPT.tmp")
 binnedts   <- bincor.tmp$Binned_time_series

 # To avoid NA's values  
 bin_ts1    <- na.omit(bincor.tmp$Binned_time_series[,1:2])
 bin_ts2    <- na.omit(bincor.tmp$Binned_time_series[,c(1,3)]) 

 #####################################################################
 # Testing our ccf_ts function
 #####################################################################
 # Screen 
 ccf_ts(bin_ts1, bin_ts2, RedL=TRUE, rmltrd="y") 

 # PDF format  
 ccf_ts(bin_ts1, bin_ts2, RedL=TRUE, rmltrd="y", device="pdf", Hpdf=6, 
  Wpdf=9, resfig=300, ofilename="ccf_ID31_ID32_res")
 
 # JPG format 
 ccf_ts(bin_ts1, bin_ts2, RedL=TRUE, rmltrd="y", device="jpg", 
  Hfig=900, Wfig=1200, resfig=150, ofilename="ccf_ID31_ID32_res")



