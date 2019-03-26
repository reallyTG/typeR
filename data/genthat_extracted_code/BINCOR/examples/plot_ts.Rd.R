library(BINCOR)


### Name: plot_ts
### Title: Plot time series
### Aliases: plot_ts plot_ts
### Keywords: plot plot time series plot_ts

### ** Examples

 #####################################################################
 #::  Figure 1 (Polanco-Martínez et al. (2018), (mimeo)). 
 #####################################################################
 library("BINCOR") 

 #####################################################################
 #:: Loading the time series under analysis: example 1 (ENSO vs. NHSST) 
 #####################################################################
 data(ENSO) 
 data(NHSST)

 #####################################################################
 # Computing the binned time series though our bin_cor_function.R 
 #####################################################################
 bincor.tmp    <- bin_cor(ENSO.dat, NHSST.dat, FLAGTAU=3, "output_ENSO_NHSST.tmp")
 binnedts      <- bincor.tmp$Binned_time_series

 #####################################################################
 # Testing our plot_ts function
 #####################################################################
 # "Screen" 
 plot_ts(ENSO.dat, NHSST.dat, binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", 
  "SST NH Mean", colts1=1, colts2=2, colbints1=3, colbints2=4, device="screen")
 
 # PDF format
 plot_ts(ENSO.dat, NHSST.dat, binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", 
  "SST NH Mean", colts1=1, colts2=2, colbints1=3, colbints2=4, device="pdf", 
  Hpdf=6, Wpdf=9, resfig=300, ofilename="plot_ts_RAW_BIN_enso_sst") 

 # PNG format 
 plot_ts(ENSO.dat, NHSST.dat, binnedts[,1:2], binnedts[,c(1,3)], "ENSO-Nino3", 
  "SST NH Mean", colts1=1, colts2=2, colbints1=3, colbints2=4, device="png", 
  Hfig=900, Wfig=1200, resfig=150, ofilename="plot_ts_RAW_BIN_enso_sst") 

 #####################################################################
 #::  Figure 4 (Polanco-Martínez et al. (2017), (mimeo)). 
 #####################################################################

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
 # Testing our plot_ts function: plot_ts.R
 #####################################################################
 # "Screen" 
 plot_ts(ID31.dat, ID32.dat, bin_ts1, bin_ts2, "MD04-2845 (Temp. forest)", 
  "MD95-2039 (Temp. forest )", colts1=1, colts2=2, colbints1=3, colbints2=4,
  device="screen") 

 # PDF format
 plot_ts(ID31.dat, ID32.dat, bin_ts1, bin_ts2, "MD04-2845 (Temp. forest)", 
  "MD95-2039 (Temp. forest )", colts1=1, colts2=2, colbints1=3, colbints2=4, 
  device="pdf", Hpdf=6, Wpdf=9, resfig=300, ofilename="ts_ACER_ABRUPT") 

 # PNG format 
 plot_ts(ID31.dat, ID32.dat, bin_ts1, bin_ts2, "MD04-2845 (Temp. forest)", 
  "MD95-2039 (Temp. forest )", colts1=1, colts2=2, colbints1=3, colbints2=4, 
  device="png",  Hfig=900, Wfig=1200, resfig=150, ofilename="ts_ACER_ABRUPT") 



