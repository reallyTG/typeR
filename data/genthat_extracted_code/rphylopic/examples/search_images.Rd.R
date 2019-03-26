library(rphylopic)


### Name: search_images
### Title: Search for images for a taxon (via its uuid)
### Aliases: search_images

### ** Examples

## Not run: 
##D search_images('1ee65cf3-53db-4a52-9960-a9f7093d845d', 
##D   subtaxa = "true", options = c("pngFiles", "credit", "licenseURL", 
##D   "svgFile", "canonicalName", "html"))
##D 
##D # all of them
##D search_images(c("1ee65cf3-53db-4a52-9960-a9f7093d845d",
##D    "08141cfc-ef1f-4d0e-a061-b1347f5297a0"), 
##D    options=c("pngFiles", "credit", "canonicalName"))
## End(Not run)



