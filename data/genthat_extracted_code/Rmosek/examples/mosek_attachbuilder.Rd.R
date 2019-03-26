library(Rmosek)


### Name: mosek_attachbuilder
### Title: Attach builder functions to the search path
###   (install,update,remove)
### Aliases: mosek_attachbuilder

### ** Examples

## Not run: 
##D #
##D # Build Rmosek for the given MOSEK Optimization Suite.
##D #
##D mosek_attachbuilder("<MSKHOME>/mosek/<MSKVERSION>/tools/platform/<PLATFORM>/bin")
##D install.rmosek()
##D 
##D #
##D # Update Rmosek for the MOSEK Optimization Suite of the last build (if any).
##D #
##D mosek_attachbuilder()    # Note: path is read from packageDescription("Rmosek")
##D update.rmosek()
##D 
##D #
##D # Build Rmosek (from offline package file) for the given MOSEK Optimization Suite.
##D #
##D mosek_attachbuilder("<MSKHOME>/mosek/<MSKVERSION>/tools/platform/<PLATFORM>/bin")
##D install.rmosek("<RMOSEKPATH>/Rmosek.tar.gz", repos=NULL)
##D 
## End(Not run)



