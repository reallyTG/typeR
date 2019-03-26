library(elastic)


### Name: docs_bulk
### Title: Use the bulk API to create, index, update, or delete documents.
### Aliases: docs_bulk

### ** Examples

## Not run: 
##D # From a file already in newline delimited JSON format
##D plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D docs_bulk(plosdat)
##D aliases_get()
##D index_delete(index='plos')
##D aliases_get()
##D 
##D # From a data.frame
##D docs_bulk(mtcars, index = "hello", type = "world")
##D ## field names cannot contain dots
##D names(iris) <- gsub("\\.", "_", names(iris))
##D docs_bulk(iris, "iris", "flowers")
##D ## type can be missing, but index can not
##D docs_bulk(iris, "flowers")
##D ## big data.frame, 53K rows, load ggplot2 package first
##D # res <- docs_bulk(diamonds, "diam")
##D # Search("diam")$hits$total
##D 
##D # From a list
##D docs_bulk(apply(iris, 1, as.list), index="iris", type="flowers")
##D docs_bulk(apply(USArrests, 1, as.list), index="arrests")
##D # dim_list <- apply(diamonds, 1, as.list)
##D # out <- docs_bulk(dim_list, index="diamfromlist")
##D 
##D # When using in a loop
##D ## We internally get last _id counter to know where to start on next bulk
##D ## insert but you need to sleep in between docs_bulk calls, longer the
##D ## bigger the data is
##D files <- c(system.file("examples", "test1.csv", package = "elastic"),
##D            system.file("examples", "test2.csv", package = "elastic"),
##D            system.file("examples", "test3.csv", package = "elastic"))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   docs_bulk(d, index = "testes", type = "docs")
##D   Sys.sleep(1)
##D }
##D count("testes", "docs")
##D index_delete("testes")
##D 
##D # You can include your own document id numbers
##D ## Either pass in as an argument
##D index_create("testes")
##D files <- c(system.file("examples", "test1.csv", package = "elastic"),
##D            system.file("examples", "test2.csv", package = "elastic"),
##D            system.file("examples", "test3.csv", package = "elastic"))
##D tt <- vapply(files, function(z) NROW(read.csv(z)), numeric(1))
##D ids <- list(1:tt[1],
##D            (tt[1] + 1):(tt[1] + tt[2]),
##D            (tt[1] + tt[2] + 1):sum(tt))
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   docs_bulk(d, index = "testes", type = "docs", doc_ids = ids[[i]],
##D     es_ids = FALSE)
##D }
##D count("testes", "docs")
##D index_delete("testes")
##D 
##D ## or include in the input data
##D ### from data.frame's
##D index_create("testes")
##D files <- c(system.file("examples", "test1_id.csv", package = "elastic"),
##D            system.file("examples", "test2_id.csv", package = "elastic"),
##D            system.file("examples", "test3_id.csv", package = "elastic"))
##D readLines(files[[1]])
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   docs_bulk(d, index = "testes", type = "docs")
##D }
##D count("testes", "docs")
##D index_delete("testes")
##D 
##D ### from lists via file inputs
##D index_create("testes")
##D for (i in seq_along(files)) {
##D   d <- read.csv(files[[i]])
##D   d <- apply(d, 1, as.list)
##D   docs_bulk(d, index = "testes", type = "docs")
##D }
##D count("testes", "docs")
##D index_delete("testes")
##D 
##D # data.frame's with a single column
##D ## this didn't use to work, but now should work
##D db <- paste0(sample(letters, 10), collapse = "")
##D index_create(db)
##D res <- data.frame(foo = 1:10)
##D out <- docs_bulk(x = res, index = db)
##D count(db)
##D index_delete(db)
##D 
##D 
##D 
##D # Curl options
##D library("httr")
##D plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D docs_bulk(plosdat, config=verbose())
##D 
##D 
##D # suppress progress bar
##D x <- docs_bulk(mtcars, index = "hello", type = "world", quiet = TRUE)
##D ## vs. 
##D x <- docs_bulk(mtcars, index = "hello", type = "world", quiet = FALSE)
## End(Not run)



