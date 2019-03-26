library(ibmdbR)


### Name: idaListAccelerators, idaSetAccelerator, idaGetAccelerator, idaGetAcceleratorDetails
### Title: Show and set accelerator settings
### Aliases: idaListAccelerators idaSetAccelerator idaGetAccelerator
###   idaGetAcceleratorDetails

### ** Examples

## Not run: 
##D #Get a list of all accelerators
##D q <- idaListAccelerators();
##D 
##D #Set accelerator to "MYACCEL"
##D idaSetAccelerator("MYACCEL");
##D 
##D #Get name of current accelerator"
##D idaGetAccelerator();
##D 
##D #Get name of current accelerator together with its encoding and query acceleration"
##D idaGetAcceleratorDetails();
##D 
##D #Get encoding of current acccelerator
##D idaGetAcceleratorDetails()$Encoding
## End(Not run)



