library(freegroup)


### Name: getlet
### Title: Get letters of a freegroup object
### Aliases: getlet

### ** Examples


x <- rfree(30,4,11)

getlet(x)

as.free(getlet(x))

identical(as.free(getlet(abc(1:26))), abc(1:26))




