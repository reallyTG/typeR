library(sparsebnUtils)


### Name: sparsebnPath
### Title: sparsebnPath class
### Aliases: sparsebnPath sparsebnPath is.sparsebnPath print.sparsebnPath
###   summary.sparsebnPath plot.sparsebnPath

### ** Examples


## Not run: 
##D ### Learn the cytometry network
##D library(sparsebn)
##D data(cytometryContinuous) # from the sparsebn package
##D cyto.data <- sparsebnData(cytometryContinuous[["data"]], type = "continuous")
##D cyto.learn <- estimate.dag(cyto.data)
##D 
##D ### Inspect the output
##D class(cyto.learn)
##D print(cyto.learn)
##D plot(cyto.learn)
## End(Not run)




