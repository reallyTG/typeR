library(document)


### Name: man
### Title: Display a Help Page From a File's Documentation
### Aliases: man

### ** Examples

## No test: 
document::document(file_name = system.file("files", "minimal.R",
                   package = "document"), check_package = FALSE)
document::man("foo")
# this equivalent to
path <- system.file("files", "minimal.R", package = "document")
document::man(x = path, topic = "foo")
## End(No test)



