library(rstudioapi)


### Name: viewer
### Title: View local web content within RStudio
### Aliases: viewer

### ** Examples

## Not run: 
##D 
##D # run an application inside the IDE
##D rstudioapi::viewer("http://localhost:8100")
##D 
##D # run an application and request a height of 500 pixels
##D rstudioapi::viewer("http://localhost:8100", height = 500)
##D 
##D # probe for viewer option then fall back to browseURL
##D viewer <- getOption("viewer")
##D if (!is.null(viewer))
##D    viewer("http://localhost:8100")
##D else
##D    utils::browseURL("http://localhost:8100")
##D 
##D # generate a temporary html file and display it
##D dir <- tempfile()
##D dir.create(dir)
##D htmlFile <- file.path(dir, "index.html")
##D # (code to write some content to the file)
##D rstudioapi::viewer(htmlFile)
## End(Not run)




