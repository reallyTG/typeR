library(arkdb)


### Name: streamable_table
### Title: streamable table
### Aliases: streamable_table

### ** Examples


streamable_readr_tsv <- function() {
  streamable_table(
    function(file, ...) readr::read_tsv(file, ...),
    function(x, path, omit_header)
      readr::write_tsv(x = x, path = path, omit_header = omit_header),
    "tsv")
}




