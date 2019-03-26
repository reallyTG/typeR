library(tractor.base)


### Name: implode
### Title: Create a character string by concatenating the elements of a
###   vector
### Aliases: implode

### ** Examples

implode(1:3, ", ")  # "1, 2, 3"
implode(1:3, ", ", " and ")  # "1, 2 and 3"
implode(1:2, ", ", " and ")  # "1 and 2"
implode(1:3, ", ", ranges=TRUE)  # "1-3"




