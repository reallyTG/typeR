library(jsonlite)


### Name: validate
### Title: Validate JSON
### Aliases: validate

### ** Examples

#Output from toJSON and serializeJSON should pass validation
myjson <- toJSON(mtcars)
validate(myjson) #TRUE

#Something bad happened
truncated <- substring(myjson, 1, 100)
validate(truncated) #FALSE



