library(HARtools)


### Name: HARviewer
### Title: View HAR object
### Aliases: HARviewer

### ** Examples

## Not run: 
##D har <- readHAR(system.file(package = "HARtools", "exdata",
##D                            "r-project.org.161028_W2_11MA.har"))
##D hv <- HARviewer(har)
##D # view in R
##D hv
##D 
##D # save and view
##D tFile <- tempfile(fileext = ".html")
##D htmlwidgets::saveWidget(hv,file = tFile)
##D browseURL(tFile)
## End(Not run)



