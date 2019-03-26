library(RSEIS)


### Name: JSAC.seis
### Title: JSAC.seis
### Aliases: JSAC.seis JSEGY.seis
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D 
##D ####  this will return a list of traces
##D Lname  <-  list.files(path='/data/wadati/bourbon/LaurelCanNC/R005.01' ,
##D  pattern="08.005.01.41.23.9024", full.names=TRUE)
##D 
##D S1   <-  JSAC.seis(Lname, Iendian = 1, PLOT = -1)
##D 
##D 
##D #####################   from a data base example: this will return one
##D #####                    trace header
##D f1  <-  DB$fn[200]
##D 
##D j1  <-  JSAC.seis(f1, Iendian=1, HEADONLY=TRUE , BIGLONG=FALSE, PLOT=-1)
##D 
##D print( j1[[1]]$HEAD )
##D 
##D 
##D #############   example for SEGY data: one SEGY  header
##D 
##D dir  <-  "/data/wadati/soju/SEISMIC_DATA/Reventador2005/rev05/SEGY/R251.01"
##D lf  <-  list.files(path=dir, pat="05.251", full.names=TRUE)
##D f1  <-  lf[1]
##D j1  <-  JSEGY.seis(f1, Iendian=1, HEADONLY=TRUE , BIGLONG=FALSE, PLOT=-1)
##D 
##D 
##D print( j1[[1]]$HEAD )
##D 
## End(Not run)







