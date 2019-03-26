library(rlist)


### Name: list.clean
### Title: Clean a list by a function
### Aliases: list.clean

### ** Examples

x <- list(a=NULL,b=list(x=NULL,y=character()),d=1,e=2)
list.clean(x)
list.clean(x, recursive = TRUE)
list.clean(x, function(x) length(x) == 0L, TRUE)



