library(RSEIS)


### Name: GET.seis
### Title: Reads various seismic file formats
### Aliases: GET.seis JGET.seis
### Keywords: misc

### ** Examples
  
## Not run: 
##D 
##D Lname  <-  list.files(path='/data/wadati/bourbon/LaurelCanNC/R005.01' ,
##D          pattern="08.005.01.41.23.9024", full.names=TRUE)
##D 
##D S1   <-  GET.seis(Lname, kind = 1, PLOT = -1)
##D 
##D ###   for data created on UNIX (SUN) but read on linux:
##D 
##D S1   <-  GET.seis(Lname, kind = 1, Iendian="swap", BIGLONG=FALSE, PLOT = -1)
##D 
##D ###   for data created on linux (32 bit)  but read on linux 64 bit:
##D 
##D S1   <-  GET.seis(Lname, kind = 1, Iendian="little", BIGLONG=FALSE, PLOT = -1)
##D 
##D ###   for SEGY data created on linux (64 bit)  but read on linux 32 bit:
##D 
##D S1   <-  GET.seis(Lname, kind = 1, Iendian="little", BIGLONG=TRUE, PLOT = -1)
##D 
##D 
##D ###   for SAC data created on MAC-OS (64 bit)  but read on linux 32 bit:
##D 
##D S1   <-  GET.seis(Lname, kind = 2, Iendian="swap", BIGLONG=TRUE, PLOT = -1)
##D 
##D 
##D ##################   
##D 
##D 
##D 
##D ##########    to use other parts of the seismic
##D ############               analysis package convert to rseis format:
##D 
##D 
##D ####  prepare the data for further processing:
##D 
##D S1   <-  JGET.seis(Lname, kind = 2, Iendian="swap", BIGLONG=TRUE, PLOT = -1)
##D 
##D  GH <- prepSEIS(S1)
##D ####   plot the data, and interact with the data
##D swig(GH, SHOWONLY=0)
##D 
##D ###  or simply:
##D 
##D plotJGET(S1)
##D 
## End(Not run)





