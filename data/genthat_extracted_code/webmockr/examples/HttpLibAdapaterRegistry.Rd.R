library(webmockr)


### Name: HttpLibAdapaterRegistry
### Title: http lib adapter registry
### Aliases: HttpLibAdapaterRegistry
### Keywords: datasets

### ** Examples

x <- HttpLibAdapaterRegistry$new()
x$register(CrulAdapter$new())
x
x$adapters
x$adapters[[1]]$name



