library(hydroApps)


### Name: ARPIEM2012.freq
### Title: Curva di frequenza delle portate al colmo di piena
### Aliases: ARPIEM2012.freq

### ** Examples

	## Not run: 
##D require(nsRFA)
##D 
##D ARPIEM2012.freq(Qind, sdQind, LCV, sdLCV, LCA, sdLCA, Qind.type, LCV_LCA.type, 
##D   n = 10000, Tr = c(20, 50, 100, 200, 500), conf.bands = c(0.1, 0.2, 0.8, 0.9))
##D 	
## End(Not run)
	
ARPIEM2012.freq(10, 5, 0.45, 0.12, 0.54, 0.23, "C", "C_C", n = 10000, 
  Tr = c(20, 50, 100, 200, 500), conf.bands = c(0.1, 0.2, 0.8, 0.9))
	



