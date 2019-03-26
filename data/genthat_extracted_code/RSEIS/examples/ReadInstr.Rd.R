library(RSEIS)


### Name: ReadInstr
### Title: Read Instrument Response in IRIS SEED format
### Aliases: ReadInstr
### Keywords: misc

### ** Examples


## Not run: 
##D library(RSEIS)
##D source('ReadInstr.R')
##D S  <-  JSAC.seis('2010.012.21.54.46.6195.IU.OTAV.00.BHZ.R.SAC', BIGLONG = FALSE)
##D GH  <-  prepSEIS(S)
##D swig(GH)
##D RESP <-
##D ReadInstr('SAC_PZs_IU_OTAV_BHZ_00_2009.091.00.00.00.0000_2010.136.22.12.60.99999')
##D GHV  <-  VELOCITY.SEISN(GH, Kal = RESP,  FILT = list(ON = TRUE, fl = 1/160,
##D fh = 7, type = "HP", proto = "BU"))
##D swig(GHV)
##D GHD  <-  DISPLACE.SEISN(GH, Kal = RESP,  FILT = list(ON = TRUE, fl = 1/160,
##D fh = 7, type = "HP", proto = "BU"))
##D swig(GHD)
##D 
##D 
## End(Not run)





