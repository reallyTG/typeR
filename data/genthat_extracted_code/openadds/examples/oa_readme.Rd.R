library(openadds)


### Name: oa_readme
### Title: Print readme from one or more datasets
### Aliases: oa_readme

### ** Examples

## Not run: 
##D # single
##D url1 <- "http://data.openaddresses.io/runs/33311/us/mi/ottawa.zip"
##D xx <- oa_get(url1)
##D oa_readme(xx)
##D cat(oa_readme(xx))
##D 
##D # many at once
##D url2 <- "http://data.openaddresses.io/runs/101436/us/ca/yolo.zip"
##D zz <- oa_get(url2)
##D oa_readme(list(xx, zz))
##D cat(oa_readme(list(xx, zz)), sep = "\n\n")
## End(Not run)



