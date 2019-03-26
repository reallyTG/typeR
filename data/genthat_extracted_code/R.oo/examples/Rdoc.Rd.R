library(R.oo)


### Name: Rdoc
### Title: Class for converting Rdoc comments to Rd files
### Aliases: Rdoc
### Keywords: classes documentation

### ** Examples
## Not run: 
##D # Set default author
##D author <- "Henrik Bengtsson, \url{http://www.braju.com/R/}"
##D 
##D # Show the file containing the Rdoc comments
##D rdocFile <- system.file("misc", "ASCII.R", package="R.oo")
##D file.show(rdocFile)
##D 
##D # Compile the Rdoc:s into Rd files (saved in the destPath directory)
##D destPath <- tempdir()
##D Rdoc$compile(rdocFile, destPath=destPath)
##D 
##D # List the generated Rd files
##D rdFiles <- list.files(destPath, full.names=TRUE)
##D print(rdFiles)
##D 
##D # Show one of the files
##D file.show(rdFiles[1])
##D 
##D # Clean up
##D file.remove(rdFiles)
## End(Not run)


