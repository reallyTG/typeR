library(corpus)


### Name: read_ndjson
### Title: JSON Data Input
### Aliases: corpus_json read_ndjson
### Keywords: file

### ** Examples

# Memory mapping
lines <- c('{ "a": 1, "b": true }',
           '{ "b": false, "nested": { "c": 100, "d": false }}',
           '{ "a": 3.14, "nested": { "d": true }}')
file <- tempfile()
writeLines(lines, file)
(data <- read_ndjson(file, mmap = TRUE))

data$a
data$b
data$nested.c
data$nested.d

rm("data")
invisible(gc()) # force the garbage collector to release the memory-map
file.remove(file)



