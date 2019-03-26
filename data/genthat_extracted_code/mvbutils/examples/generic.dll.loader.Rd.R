library(mvbutils)


### Name: generic.dll.loader
### Title: Convenient automated loading of DLLs
### Aliases: generic.dll.loader create.wrappers.for.dll ldyn.tester
###   ldyn.unload
### Keywords: misc

### ** Examples

## Not run: 
##D mypack:::.onLoad <- function( libname, pkgname) generic.dll.loader( libname, pkgname)
##D #... or just copy the code into your .onLoad
##D # For casual testing of a DLL that's not yet in a package
##D dl <- ldyn.tester( 'path/to/my/dll/libs/i386/mydll.dll')
##D getDLLRegisteredRoutines( l1)
##D LL_mydll <- create.wrappers.for.dll( dl)
##D .C( LL_mydll$C_rout1, as.integer( 0)) # ... whatever!
##D ldyn.unload( dl)
##D # Safer because not permanent:
##D assign( 'dl', ldyn.tester( 'path/to/my/dll/libs/i386/mydll.dll'), pos='mvb.session.info')
##D assign( 'LL_mydll', create.wrappers.for.dll( dl), pos='mvb.session.info')
##D .C( LL.mydll$C_rout1, as.integer( 0)) # ... whatever!
## End(Not run)



