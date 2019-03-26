library(gdata)


### Name: object.size
### Title: Report the Space Allocated for Objects
### Aliases: object.size c.object_sizes as.object_sizes is.object_sizes
###   format.object_sizes print.object_sizes
### Keywords: utilities

### ** Examples

object.size(letters)
object.size(ls)
## find the 10 largest objects in the base package
allObj <- sapply(ls("package:base"),
            function(x)
                object.size(get(x, envir = baseenv()))
            )

( bigObj <- as.object_sizes(rev(sort(allObj))[1:10] ) )
print(bigObj, humanReadable=TRUE)


as.object_sizes(14567567)

## Don't show: 
    optionsOrig <- options("humanReadable")
## End(Don't show)

options(humanReadable=TRUE)
(
    z <- object.size(letters,
                     c(letters, letters),
                     rep(letters, 100),
                     rep(letters, 10000)
                     )
)
is.object_sizes(z)
as.object_sizes(14567567)

## Don't show: 
    options(optionsOrig)
## End(Don't show)




