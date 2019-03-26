library(Rook)


### Name: Rhttpd-class
### Title: Class 'Rhttpd'
### Aliases: Rhttpd-class Rhttpd
### Keywords: classes

### ** Examples


# Create an Rhttpd object and start the internal web server. Note that
# if there are no applications added, then the default RookTest app in
# system.file('exampleApps/RookTestApp.R',package='Rook') is automatically
# added.

s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
##D s$browse(1)
## End(Not run)
s$print()

# Be sure to install the Hmisc package before installing and running
# this application. You will want to; it's a pretty good one.
# s$add(
#    app=system.file('exampleApps/Hmisc/config.R',package='Rook'),
#    name='hmisc')

s$add(
    app=system.file('exampleApps/helloworld.R',package='Rook'),
    name='hello'
)
s$add(
    app=system.file('exampleApps/helloworldref.R',package='Rook'),
    name='helloref'
)
s$add(
    app=system.file('exampleApps/summary.R',package='Rook'),
    name='summary'
)

s$print()

#  Stops the server but doesn't uninstall the app
## Not run: 
##D s$stop()
## End(Not run)
s$remove(all=TRUE)
rm(s)



