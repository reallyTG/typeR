library(sparsebnUtils)


### Name: sparsebnFit
### Title: sparsebnFit class
### Aliases: sparsebnFit sparsebnFit is.sparsebnFit print.sparsebnFit
###   summary.sparsebnFit plot.sparsebnFit

### ** Examples


## Not run: 
##D ### Learn the cytometry network
##D library(sparsebn)
##D data(cytometryContinuous) # from the sparsebn package
##D cyto.data <- sparsebnData(cytometryContinuous[["data"]], type = "continuous")
##D cyto.learn <- estimate.dag(cyto.data)
##D 
##D ### Inspect the output
##D class(cyto.learn[[1]])
##D print(cyto.learn[[2]])
##D show.parents(cyto.learn[[1]], c("raf", "mek", "plc"))
##D 
##D ### Manipulate a particular graph
##D cyto.fit <- cyto.learn[[7]]
##D num.nodes(cyto.fit)
##D num.edges(cyto.fit)
##D show.parents(cyto.fit, c("raf", "mek", "plc"))
##D plot(cyto.fit)
##D 
##D ### Use graph package instead of edgeLists
##D setGraphPackage("graph", coerce = TRUE) # set sparsebn to use graph package
##D cyto.edges <- cyto.fit$edges
##D degree(cyto.edges)       # only available with graph package
##D isConnected(cyto.edges)  # only available with graph package
## End(Not run)




