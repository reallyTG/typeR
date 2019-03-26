library(ndjson)


### Name: validate
### Title: Validate ndjson file
### Aliases: validate

### ** Examples

f <- system.file("extdata", "test.json", package="ndjson")
validate(f)

gzf <- system.file("extdata", "testgz.json.gz", package="ndjson")
validate(gzf)



