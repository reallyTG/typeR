library(gistr)


### Name: gist_create_obj
### Title: Create a gist from an R object
### Aliases: gist_create_obj

### ** Examples

## Not run: 
##D ## data.frame
##D ### by default makes pretty table in markdown format
##D row.names(mtcars) <- NULL
##D gist_create_obj(mtcars)
##D gist_create_obj(iris)
##D ### or just push up json
##D gist_create_obj(mtcars, pretty = FALSE)
##D 
##D ## matrix
##D gist_create_obj(as.matrix(mtcars))
##D ## list
##D gist_create_obj(apply(mtcars, 1, as.list))
##D ## character
##D gist_create_obj("hello, world")
##D ## numeric
##D gist_create_obj(runif(10))
##D 
##D ## Assign a specific file name
##D gist_create_obj("
##D ## header2
##D 
##D hey there!", filename = "my_markdown.md")
## End(Not run)



