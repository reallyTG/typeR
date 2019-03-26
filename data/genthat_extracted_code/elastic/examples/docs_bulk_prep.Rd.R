library(elastic)


### Name: docs_bulk_prep
### Title: Use the bulk API to prepare bulk format data
### Aliases: docs_bulk_prep

### ** Examples

## Not run: 
##D # From a data.frame
##D ff <- tempfile(fileext = ".json")
##D docs_bulk_prep(mtcars, index = "hello", type = "world", path = ff)
##D readLines(ff)
##D 
##D ## field names cannot contain dots
##D names(iris) <- gsub("\\.", "_", names(iris))
##D docs_bulk_prep(iris, "iris", "flowers", path = tempfile(fileext = ".json"))
##D 
##D ## type can be missing, but index can not
##D docs_bulk_prep(iris, "flowers", path = tempfile(fileext = ".json"))
##D 
##D # From a list
##D docs_bulk_prep(apply(iris, 1, as.list), index="iris", type="flowers",
##D    path = tempfile(fileext = ".json"))
##D docs_bulk_prep(apply(USArrests, 1, as.list), index="arrests",
##D    path = tempfile(fileext = ".json"))
##D 
##D # when chunking
##D ## multiple files created, one for each chunk
##D bigiris <- do.call("rbind", replicate(30, iris, FALSE))
##D docs_bulk_prep(bigiris, index = "big", path = tempfile(fileext = ".json"))
##D 
##D # When using in a loop
##D ## We internally get last _id counter to know where to start on next bulk
##D ## insert but you need to sleep in between docs_bulk_prep calls, longer the
##D ## bigger the data is
##D files <- c(system.file("examples", "test1.csv", package = "elastic"),
##D            system.file("examples", "test2.csv", package = "elastic"),
##D            system.file("examples", "test3.csv", package = "elastic"))
##D paths <- vector("list", length = length(files))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   paths[i] <- docs_bulk_prep(d, index = "stuff", type = "docs",
##D      path = tempfile(fileext = ".json"))
##D }
##D unlist(paths)
##D 
##D # You can include your own document id numbers
##D ## Either pass in as an argument
##D files <- c(system.file("examples", "test1.csv", package = "elastic"),
##D            system.file("examples", "test2.csv", package = "elastic"),
##D            system.file("examples", "test3.csv", package = "elastic"))
##D tt <- vapply(files, function(z) NROW(read.csv(z)), numeric(1))
##D ids <- list(1:tt[1],
##D            (tt[1] + 1):(tt[1] + tt[2]),
##D            (tt[1] + tt[2] + 1):sum(tt))
##D paths <- vector("list", length = length(files))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   paths[i] <- docs_bulk_prep(d, index = "testes", type = "docs",
##D     doc_ids = ids[[i]], es_ids = FALSE, path = tempfile(fileext = ".json"))
##D }
##D unlist(paths)
##D 
##D ## or include in the input data
##D ### from data.frame's
##D files <- c(system.file("examples", "test1_id.csv", package = "elastic"),
##D            system.file("examples", "test2_id.csv", package = "elastic"),
##D            system.file("examples", "test3_id.csv", package = "elastic"))
##D paths <- vector("list", length = length(files))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   paths[i] <- docs_bulk_prep(d, index = "testes", type = "docs",
##D      path = tempfile(fileext = ".json"))
##D }
##D unlist(paths)
##D 
##D ### from lists via file inputs
##D paths <- vector("list", length = length(files))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   d <- apply(d, 1, as.list)
##D   paths[i] <- docs_bulk_prep(d, index = "testes", type = "docs",
##D       path = tempfile(fileext = ".json"))
##D }
##D unlist(paths)
##D 
##D 
##D # suppress progress bar
##D docs_bulk_prep(mtcars, index = "hello", type = "world", 
##D   path = tempfile(fileext = ".json"), quiet = TRUE)
##D ## vs. 
##D docs_bulk_prep(mtcars, index = "hello", type = "world", 
##D   path = tempfile(fileext = ".json"), quiet = FALSE)
## End(Not run)



