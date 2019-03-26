library(knitr)


### Name: imgur_upload
### Title: Upload an image to imgur.com
### Aliases: imgur_upload

### ** Examples

## Not run: 
##D f = tempfile(fileext = ".png")
##D png(f)
##D plot(rnorm(100), main = R.version.string)
##D dev.off()
##D 
##D res = imgur_upload(f)
##D res  # link to original URL of the image
##D attr(res, "XML")  # all information
##D if (interactive()) 
##D     browseURL(res)
##D 
##D # to use your own key
##D opts_knit$set(upload.fun = function(file) imgur_upload(file, key = "your imgur key"))
## End(Not run)



