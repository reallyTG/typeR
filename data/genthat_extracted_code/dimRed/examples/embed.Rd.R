library(dimRed)


### Name: embed
### Title: dispatches the different methods for dimensionality reduction
### Aliases: embed embed,formula-method embed,ANY-method
###   embed,dimRedData-method

### ** Examples

## Not run: 
##D embed_methods <- dimRedMethodList()
##D quality_methods <- dimRedQualityList()
##D dataset <- loadDataSet("Iris")
##D 
##D quality_results <- matrix(NA, length(embed_methods), length(quality_methods),
##D                               dimnames = list(embed_methods, quality_methods))
##D embedded_data <- list()
##D 
##D for (e in embed_methods) {
##D   message("embedding: ", e)
##D   embedded_data[[e]] <- embed(dataset, e, .mute = c("message", "output"))
##D   for (q in quality_methods) {
##D     message("  quality: ", q)
##D     quality_results[e, q] <- tryCatch(
##D       quality(embedded_data[[e]], q),
##D       error = function(e) NA
##D     )
##D   }
##D }
##D 
##D print(quality_results)
## End(Not run)
## embed a data.frame using a formula:
head(as.data.frame(
  embed(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
        iris, "PCA")
))

head(as.data.frame(
  embed(iris[, 1:4], "PCA")
))
head(as.data.frame(
  embed(as.matrix(iris[, 1:4]), "PCA")
))



