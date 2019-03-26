library(galgo)


### Name: loadObject
### Title: Load saved data of class Object and use reObject as necessary
### Aliases: loadObject
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
class(uo)
uoTempFile <- file.path(tempdir(), "uo.Rdata")
save(uo, file=uoTempFile)


### perhaps other session here
library(R.oo)
loadObject(uoTempFile)
uo
class(uo)
# the class is the original from the original object (o in this case)

### equivalent to:
library(R.oo)
load(uoTempFile)
uo <- reObject(uo)
uo
class(uo)



