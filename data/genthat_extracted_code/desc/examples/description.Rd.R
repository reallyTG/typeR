library(desc)


### Name: description
### Title: Read, write, update, validate DESCRIPTION files
### Aliases: description
### Keywords: datasets

### ** Examples

## Create a template
desc <- description$new("!new")
desc

## Read a file
desc2 <- description$new(file = system.file("DESCRIPTION",
                           package = "desc"))
desc2

## Remove a field
desc2$del("LazyData")

## Add another one
desc2$set(VignetteBuilder = "knitr")
desc2$get("VignetteBuilder")
desc2



