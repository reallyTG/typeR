library(vapour)


### Name: vapour_layer_names
### Title: Read GDAL layer names
### Aliases: vapour_layer_names

### ** Examples

file <- "list_locality_postcode_meander_valley.tab"
mvfile <- system.file(file.path("extdata/tab", file), package="vapour")
vapour_layer_names(mvfile)



