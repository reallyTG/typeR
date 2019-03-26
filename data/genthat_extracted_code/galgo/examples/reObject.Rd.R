library(galgo)


### Name: reObject
### Title: Creates proper extended Object from a list obtained by unObject
### Aliases: reObject
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
x <- reObject(uo)
class(x)
names(x)
x$x
x$y



### saving/retriving
library(R.oo)
o <- Object()
o$x = 1
o$y = 2
uo <- unObject(o)
uoTempFile <- file.path(tempdir(), "uo.Rdata")
save(uo, file=uoTempFile)
### perhaps other session here
library(R.oo) 
#if your object requiere other sub-class (extend Object) and/or method definition, 
#load it here before using reObject otherwise an error would occur.
load(uoTempFile) 
class(uo)             ## uo now is a list
uo
x <- reObject(uo)
class(x)                ### now x is Object
names(x)
x$x
x$y
x



