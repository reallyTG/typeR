library(nanotime)


### Name: nanotime-class
### Title: Nanosecond resolution datetime functionality
### Aliases: nanotime-class nanotime nanotime,character-method
###   nanotime.matrix nanotime,POSIXct-method nanotime,POSIXlt-method
###   nanotime,Date-method print,nanotime-method show,nanotime-method
###   format.nanotime index2char.nanotime as.POSIXct.nanotime
###   as.POSIXlt.nanotime as.Date.nanotime as.data.frame.nanotime
###   as.integer64.nanotime as.integer64 -,nanotime,character-method
###   -,nanotime,nanotime-method -,nanotime,integer64-method
###   -,nanotime,numeric-method -,ANY,nanotime-method -,nanotime,ANY-method
###   +,nanotime,ANY-method +,nanotime,integer64-method
###   +,nanotime,numeric-method +,ANY,nanotime-method
###   +,integer64,nanotime-method +,numeric,nanotime-method
###   +,nanotime,nanotime-method Arith,nanotime,ANY-method
###   Arith,ANY,nanotime-method Compare,nanotime,ANY-method
###   Compare,nanotime,nanotime-method Logic,nanotime,ANY-method
###   Logic,ANY,nanotime-method Math,nanotime-method Math2,nanotime-method
###   Summary,nanotime-method min,nanotime-method max,nanotime-method
###   range,nanotime-method Complex,nanotime-method [,nanotime-method
###   [<-,nanotime-method c.nanotime nanotime-package
###   names<-,nanotime-method is.na,nanotime-method

### ** Examples

x <- nanotime("1970-01-01T00:00:00.000000001+00:00")
print(x)
x <- x + 1
print(x)
format(x)
x <- x + 10
print(x)
format(x)
format(nanotime(Sys.time()) + 1:3)  # three elements each 1 ns apart



