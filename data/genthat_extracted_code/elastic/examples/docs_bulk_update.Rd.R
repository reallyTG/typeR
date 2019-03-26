library(elastic)


### Name: docs_bulk_update
### Title: Use the bulk API to update documents
### Aliases: docs_bulk_update

### ** Examples

## Not run: 
##D connect()
##D if (index_exists("foobar")) index_delete("foobar")
##D 
##D df <- data.frame(name = letters[1:3], size = 1:3, id = 100:102)
##D invisible(docs_bulk(df, 'foobar', 'foobar', es_ids = FALSE))
##D 
##D # add new rows in existing fields
##D (df2 <- data.frame(size = c(45, 56), id = 100:101))
##D Search("foobar", asdf = TRUE)$hits$hits
##D invisible(docs_bulk_update(df2, index = 'foobar', type = 'foobar'))
##D Search("foobar", asdf = TRUE)$hits$hits
##D 
##D # add new fields (and new rows by extension)
##D (df3 <- data.frame(color = c("blue", "red", "green"), id = 100:102))
##D Search("foobar", asdf = TRUE)$hits$hits
##D invisible(docs_bulk_update(df3, index = 'foobar', type = 'foobar'))
##D Search("foobar", asdf = TRUE)$hits$hits
## End(Not run)



