library(adfExplorer)


### Name: put.adf.file
### Title: Put a file onto an amigaDisk object
### Aliases: put.adf.file
###   put.adf.file,amigaDisk,raw,character,POSIXt,character-method
###   put.adf.file
###   put.adf.file,amigaDisk,raw,character,POSIXt,missing-method
###   put.adf.file
###   put.adf.file,amigaDisk,raw,character,missing,missing-method
###   put.adf.file
###   put.adf.file,amigaDisk,character,character,POSIXt,character-method
###   put.adf.file
###   put.adf.file,amigaDisk,character,character,POSIXt,missing-method
###   put.adf.file
###   put.adf.file,amigaDisk,character,character,missing,missing-method
###   put.adf.file
###   put.adf.file,amigaDisk,character,missing,missing,missing-method

### ** Examples

## Not run: 
##D ## create a blank disk to put files onto:
##D blank.disk <- blank.amigaDOSDisk("blank", "DD", "OFS", TRUE, FALSE, FALSE)
##D 
##D ## let's copy the base package 'INDEX' file onto the
##D ## virtual disk:
##D blank.disk <- put.adf.file(blank.disk, system.file("INDEX"))
##D 
##D ## We can also put raw data onto the virtual disk:
##D blank.disk <- put.adf.file(blank.disk, raw(2048), "DF0:null.dat")
##D 
##D ## check whether we succeeded:
##D list.adf.files(blank.disk)
## End(Not run)



