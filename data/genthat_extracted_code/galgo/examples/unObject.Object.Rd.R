library(galgo)


### Name: unObject
### Title: Converts variables from class Object (and derived classes) to
###   list
### Aliases: unObject unObject.Object unObject.list
### Keywords: methods

### ** Examples

library(R.oo)  # needed library
o <- Object()
o$x = 1
o$y = 2
o$x
o$y
o
class(o)
names(o)
uo <- unObject(o)
uo



