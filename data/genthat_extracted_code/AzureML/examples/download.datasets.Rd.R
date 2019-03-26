library(AzureML)


### Name: download.datasets
### Title: Download one or more datasets from an AzureML workspace.
### Aliases: download.datasets

### ** Examples

## Not run: 
##D   library(AzureML)
##D   
##D   name <- "Blood donation data"
##D   
##D   ws <- workspace()
##D   
##D   # The following three alternatives produce the same output:
##D   frame1 <- download.datasets(ws, name)
##D   frame2 <- download.datasets(datasets(ws), name)
##D 
##D   # Note that one can examine all the names, sizes, etc. of the datasets
##D   # in ws by examining d:
##D   d <- datasets(ws)
##D   frame3 <- download.datasets(subset(d, Name == name))
##D 
##D   head(frame1)
## End(Not run)



