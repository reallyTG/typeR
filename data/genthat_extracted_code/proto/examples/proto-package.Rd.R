library(proto)


### Name: proto-package
### Title: Object-Oriented Programming with the Prototype Model
### Aliases: proto-package
### Keywords: programming

### ** Examples


cat("parent\n")
oop <- proto(x = 10, view = function(.) paste("this is a:", .$x))
oop$ls()
oop$view()

cat("override view in parent\n")
ooc1 <- oop$proto(view = function(.) paste("this is a: ***", .$x, "***"))
ooc1$view()

cat("override x in parent\n")
ooc2 <- oop$proto(x = 20)
ooc2$view()



