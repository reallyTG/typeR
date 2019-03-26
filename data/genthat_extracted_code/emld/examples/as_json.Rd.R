library(emld)


### Name: as_json
### Title: Coerce an emld object into JSON
### Aliases: as_json

### ** Examples

f <- system.file("extdata/example.xml", package = "emld")
emld <- as_emld(f)
json <- as_json(emld)
## can also write a json file to disk:
json_file <- tempfile()
as_json(emld, json_file)



