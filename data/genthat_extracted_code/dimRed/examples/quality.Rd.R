library(dimRed)


### Name: quality,dimRedResult-method
### Title: Quality Criteria for dimensionality reduction.
### Aliases: quality,dimRedResult-method quality quality.dimRedResult
###   dimRedQualityList

### ** Examples

## Not run: 
##D embed_methods <- dimRedMethodList()
##D quality_methods <- dimRedQualityList()
##D scurve <- loadDataSet("3D S Curve", n = 500)
##D 
##D quality_results <- matrix(NA, length(embed_methods), length(quality_methods),
##D                               dimnames = list(embed_methods, quality_methods))
##D embedded_data <- list()
##D 
##D for (e in embed_methods) {
##D   message("embedding: ", e)
##D   embedded_data[[e]] <- embed(scurve, e, .mute = c("message", "output"))
##D   for (q in quality_methods) {
##D     message("  quality: ", q)
##D     quality_results[e, q] <- tryCatch(
##D       quality(embedded_data[[e]], q),
##D       error = function (e) NA
##D     )
##D   }
##D }
##D 
##D print(quality_results)
## End(Not run)



