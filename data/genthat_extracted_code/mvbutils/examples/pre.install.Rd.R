library(mvbutils)


### Name: pre.install
### Title: Update a source and/or installed package from a task package
### Aliases: pre.install patch.installed patch.install pre.install.hook...
###   spkg
### Keywords: programming utilities

### ** Examples

## Not run: 
##D # Workflow for simple case:
##D cd( task.above.mypack)
##D maintain.packages( mypack)
##D # First-time setup, or after major R version changes:
##D pre.install( mypack)
##D install.pkg( mypack)
##D library( mypack)
##D # ... do stuff
##D # Subsequent maintenance:
##D maintain.packages( mypack) # only once per session, usually at the start
##D library( mypack) # maybe optional
##D # ...do various things involving changes to mypack, then...
##D patch.install( mypack) # keep disk image up-to-date
##D # Prepare copies for distribution
##D build.pkg( mypack) # for Linux or CRAN
##D build.pkg.binary( mypack) # for Windows or Macs
##D check.pkg( mypack) # if you like that sort of thing
## End(Not run)



