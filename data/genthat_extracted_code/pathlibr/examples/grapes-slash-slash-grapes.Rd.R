library(pathlibr)


### Name: %//%
### Title: Join two paths
### Aliases: %//%

### ** Examples

path <- Path$new("root/parent/name")
child <- path %//% "child"
print(glue::glue("path : {path$show}",
                 "child: {child$show}",
                 .sep = "\n"))



