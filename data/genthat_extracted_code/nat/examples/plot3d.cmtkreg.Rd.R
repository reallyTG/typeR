library(nat)


### Name: plot3d.cmtkreg
### Title: Plot the domain of a CMTK registration
### Aliases: plot3d.cmtkreg

### ** Examples

## Not run: 
##D testdatadir=system.file("tests/testthat/testdata/cmtk", package="nat")
##D regpath=file.path(testdatadir,'FCWB_JFRC2_01_warp_level-01.list/')
##D plot3d(cmtkreg(regpath))
##D 
##D # or read registration into memory if you want to work with it
##D reg=read.cmtkreg(regpath)
##D # nb calling plot3d.cmtkreg directly (rather than using the generic plot3d) 
##D # is considered bad style but read.cmtkreg returns a plain list 
##D # so method dispatch will fail
##D nat:::plot3d.cmtkreg(reg)
## End(Not run)



