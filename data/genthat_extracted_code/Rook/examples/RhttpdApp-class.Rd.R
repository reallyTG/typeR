library(Rook)


### Name: RhttpdApp-class
### Title: Class 'RhttpdApp'
### Aliases: RhttpdApp-class RhttpdApp
### Keywords: classes

### ** Examples


s <- Rhttpd$new()
s$add(RhttpdApp$new(
    name='summary',
    app=system.file('exampleApps/summary.R',package='Rook')
))
## Not run: 
##D s$start(quiet=TRUE)
##D s$browse(1)
## End(Not run)
s$remove(all=TRUE)

#  Stops the server but doesn't uninstall the app
## Not run: 
##D s$stop()
## End(Not run)
s$remove(all=TRUE)
rm(s)



