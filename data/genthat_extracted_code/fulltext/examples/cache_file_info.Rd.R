library(fulltext)


### Name: cache_file_info
### Title: Get information on possibly bad files in your cache
### Aliases: cache_file_info

### ** Examples

# identify likely bad files
res <- cache_file_info()

# you can remove them yourself, e.g.,
# invisible(lapply(res$xml_abstract_only, unlink))



