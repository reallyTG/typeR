library(elastic)


### Name: field_stats
### Title: Search field statistics
### Aliases: field_stats

### ** Examples

## Not run: 
##D connect()
##D 
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   field_stats(body = '{ "fields": ["speaker"] }', index = "shakespeare")
##D   ff <- c("scientificName", "continent", "decimalLatitude", "play_name", 
##D     "speech_number")
##D   field_stats("play_name")
##D   field_stats("play_name", level = "cluster")
##D   field_stats(ff, level = "indices")
##D   field_stats(ff)
##D   field_stats(ff, index = c("gbif", "shakespeare"))
##D 
##D   # can also pass a body, just as with Search()
##D   # field_stats(body = list(fields = "rating")) # doesn't work
##D   field_stats(body = '{ "fields": ["scientificName"] }', index = "gbif")
##D 
##D   body <- '{
##D     "fields" : ["scientificName", "decimalLatitude"]
##D   }'
##D   field_stats(body = body, level = "indices", index = "gbif")
##D }
## End(Not run)



