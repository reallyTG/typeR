library(ndjson)


### Name: stream_in
### Title: Stream in & flatten an ndjson file into a 'tbl_dt'
### Aliases: stream_in

### ** Examples

f <- system.file("extdata", "test.json", package="ndjson")
nrow(stream_in(f))

gzf <- system.file("extdata", "testgz.json.gz", package="ndjson")
nrow(stream_in(gzf))



