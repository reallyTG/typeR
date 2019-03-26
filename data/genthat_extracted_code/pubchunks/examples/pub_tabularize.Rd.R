library(pubchunks)


### Name: pub_tabularize
### Title: Tabularize chunks output
### Aliases: pub_tabularize

### ** Examples

# one at a time
## example 1, a file path
x <- system.file("examples/elife_1.xml", package = "pubchunks")
(res <- pub_chunks(x, c("doi", "title", "keywords")))
pub_tabularize(res)

## example 2, a file path
y <- system.file("examples/frontiers_1.xml", package = "pubchunks")
(res2 <- pub_chunks(y, c("doi", "title", "keywords")))
pub_tabularize(res2)

# > 1, a list of file paths
x <- system.file("examples/elife_1.xml", package = "pubchunks")
y <- system.file("examples/frontiers_1.xml", package = "pubchunks")
(res <- pub_chunks(list(x, y), c("doi", "title", "keywords")))
pub_tabularize(res)
pub_tabularize(res, bind = TRUE)

## Not run: 
##D # using output of fulltext::ft_get()
##D if (requireNamespace("fulltext", quietly = TRUE)) {
##D   dois <- c('10.1371/journal.pone.0086169', '10.1371/journal.pone.0155491', 
##D     '10.7554/eLife.03032')
##D   x <- fulltext::ft_get(dois)
##D   (tmp <- pub_chunks(fulltext::ft_collect(x), sections=c("doi","title")))
##D   pub_tabularize(tmp)
##D   pub_tabularize(tmp, bind = TRUE)
##D }
## End(Not run)



