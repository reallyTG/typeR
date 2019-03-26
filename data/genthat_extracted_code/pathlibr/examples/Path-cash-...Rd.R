library(pathlibr)


### Name: Path$..
### Title: Get the parent of the current Path
### Aliases: Path$..

### ** Examples

path <- Path$new("root/parent/path")
print(glue::glue("path   : {path$show}",
                 "parent : {path$parent$show}",
                 "..     : {path$..$show}",
                 .sep = "\n"))



