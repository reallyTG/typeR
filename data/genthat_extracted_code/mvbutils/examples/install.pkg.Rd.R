library(mvbutils)


### Name: install.pkg
### Title: Package building, distributing, and checking
### Aliases: install.pkg build.pkg build.pkg.binary check.pkg
###   cull.old.builds set.rcmd.vars
### Keywords: misc

### ** Examples

## Not run: 
##D # First time package installation
##D # Must be cd()ed to task above 'mvbutils'
##D maintain.packages( mvbutils)
##D pre.install( mvbutils)
##D install.pkg( mvbutils)
##D # Subsequent maintenance is all done by:
##D patch.install( mvbutils)
##D # For distro to
##D build.pkg( mvbutils)
##D # or on Windows (?and Macs?)
##D build.pkg.binary( mvbutils)
##D # If you enjoy R CMD CHECK:
##D check.pkg( mvbutils)
##D # Also legal:
##D build.pkg( ..mvbutils)
##D # To do it under programmatic control
##D for( ipack in all.my.package.names) {
##D   build.pkg( char=ipack)
##D }
## End(Not run)



