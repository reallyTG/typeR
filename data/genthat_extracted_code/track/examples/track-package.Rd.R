library(track)


### Name: track-intro
### Title: Overview of track package
### Aliases: track-intro track-package track-overview track.intro
###   track.package track.overview
### Keywords: package data database utilities

### ** Examples

##############################################################
# Warning: running this example will cause variables currently
# in the R global environment to be written to .RData files
# in a tracking database on the filesystem under R's temporary
# directory, and will cause the variables to be removed from
# the R global environment.
# It is recommended to run this example with a fresh R session
# with no important variables in the global environment.
##############################################################

library(track)
# Start tracking the global environment using a tmp directory
# Default tracking db dir is 'rdatadir' in the current working
# directory; omit the dir= argument to use this.
if (!is.element('tmpenv', search())) attach(new.env(), name='tmpenv', pos=2)
assign('tmpdatadir', pos='tmpenv', value=file.path(tempdir(), 'rdatadir1'))
track.start(dir=tmpdatadir)
a <- 1
b <- 2
ls()
track.status()
track.summary()
track.info()
track.stop()
# Variables are now gone because default action of track.stop()
# is to not read all tracked variables into memory (this could
# exhaust memory and/or be very time consuming).
ls()
# bring them back
track.start(dir=tmpdatadir)
ls()
# It is possible to keep tracked vars after stopping tracking:
track.stop(keepVars=TRUE)
ls()



