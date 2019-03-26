library(storr)


### Name: fetch_hook_read
### Title: Hook to fetch a resource from a file.
### Aliases: fetch_hook_read

### ** Examples

hook <- fetch_hook_read(
    function(key, namespace) paste0(key, ".csv"),
    function(filename) read.csv(filename, stringsAsFactors = FALSE))



