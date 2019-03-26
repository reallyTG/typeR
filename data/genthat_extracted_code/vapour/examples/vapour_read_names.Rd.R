library(vapour)


### Name: vapour_read_names
### Title: Read feature names
### Aliases: vapour_read_names

### ** Examples

file <- "list_locality_postcode_meander_valley.tab"
mvfile <- system.file(file.path("extdata/tab", file), package="vapour")
range(fids <- vapour_read_names(mvfile))
length(fids)



