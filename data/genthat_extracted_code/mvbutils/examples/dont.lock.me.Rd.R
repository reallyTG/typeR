library(mvbutils)


### Name: dont.lock.me
### Title: Prevent sealing of a namespace, to facilitate package
###   maintenance.
### Aliases: dont.lock.me
### Keywords: programming

### ** Examples

## Not run: 
##D # This unseals the namespace of MYPACK only if the option "maintaining.MYPACK" is non-NULL:
##D .onLoad <- function( libname, pkgname) {
##D   if( !is.null( getOption( 'maintaining.' %&% pkgname)))
##D     mvbutils:::dont.lock.me()
##D }
## End(Not run)



