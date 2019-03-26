library(auk)


### Name: auk_select
### Title: Select a subset of columns
### Aliases: auk_select

### ** Examples

## Not run: 
##D # select a minimal set of columns
##D out_file <- tempfile()
##D ebd <- auk_ebd(system.file("extdata/ebd-sample.txt", package = "auk"))
##D cols <- c("latitude", "longitude",
##D           "group identifier", "sampling event identifier", 
##D           "scientific name", "observation count")
##D selected <- auk_select(ebd, select = cols, file = out_file)
##D str(read_ebd(selected))
## End(Not run)



