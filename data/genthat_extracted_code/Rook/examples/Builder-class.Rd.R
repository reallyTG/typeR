library(Rook)


### Name: Builder-class
### Title: Class 'Builder'
### Aliases: Builder-class Builder
### Keywords: classes

### ** Examples


# The following is the Hmisc example. Explore the folder
# system.file('exampleApps/Hmisc',package='Rook') for more information.
s <- Rhttpd$new()
## Not run: 
##D library(Hmisc)
##D dir.create(file.path(tempdir(),'plots'),showWarnings=FALSE)
##D s$add( name="Hmisc",
##D     app=Builder$new(
##D         Static$new(
##D             urls = c('/css','/images','/javascript'),
##D             root = system.file('exampleApps/Hmisc',package='Rook')
##D         ),
##D         Static$new(urls='/plots',root=tempdir()),
##D         Brewery$new(
##D             url='/brew',
##D             root= system.file('exampleApps/Hmisc',package='Rook'),
##D             imagepath=file.path(tempdir(),'plots'),
##D             imageurl='../plots/'
##D         ),
##D         Redirect$new('/brew/useR2007.rhtml')
##D     )
##D )
##D s$start(quiet=TRUE)
##D s$browse('Hmisc') # Opens a browser window to the application.
##D s$remove(all=TRUE)
##D s$stop()
## End(Not run)



