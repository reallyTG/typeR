library(auk)


### Name: auk_split
### Title: Split an eBird data file by species
### Aliases: auk_split

### ** Examples

## Not run: 
##D species <- c("Canada Jay", "Cyanocitta stelleri")
##D # get the path to the example data included in the package
##D # in practice, provide path to a filtered ebd file
##D # e.g. f <- "data/ebd_filtered.txt
##D f <- system.file("extdata/ebd-sample.txt", package = "auk")
##D # output to a temporary directory for example
##D # in practice, provide the path to the output location
##D # e.g. prefix <- "output/ebd_"
##D prefix <- file.path(tempdir(), "ebd_")
##D species_files <- auk_split(f, species = species, prefix = prefix)
## End(Not run)



