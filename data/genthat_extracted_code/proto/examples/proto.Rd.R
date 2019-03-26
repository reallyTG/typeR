library(proto)


### Name: proto
### Title: Prototype object-based programming
### Aliases: proto as.proto as.proto.environment as.proto.list
###   as.proto.data.frame as.proto.proto isnot.function is.proto $.proto
###   $<-.proto with.proto str.proto . this .that that .super super
###   print.instantiatedProtoMethod as.proto as.proto.environment
###   as.proto.proto as.proto.list is.proto
### Keywords: programming

### ** Examples

oo <- proto(expr = {
   x = c(10, 20, 15, 19, 17)
   location = function(.) mean(.$x) # 1st arg is object
   rms = function(.) sqrt(mean((.$x - .$location())^2))
   bias = function(., b) .$x <- .$x + b
})

debug(oo$with(rms)) # cannot use oo$rms to pass method as a value
undebug(oo$with(rms)) # cannot use oo$rms to pass method as a value

oo2 <- oo$proto( location = function(.) median(.$x) )
oo2$rms()      # note that first argument is omitted.
oo2$ls()       # list components of oo2
oo2$as.list()  # contents of oo2 as a list
oo2            # oo2 itself
oo2$parent.env() # same
oo2$parent.env()$as.list() # contents of parent of oo2
oo2$print()
oo2$ls()
oo2$str()
oo3 <- oo2
oo2$identical(oo3)
oo2$identical(oo)

# start off with Root to avoid problem cited in Note
Root <- proto()
oop <- Root$proto(a = 1, incr = function(.) .$a <- .$a+1)
ooc <- oop$proto(a = 3) # ooc is child of oop but with a=3
ooc$incr()
ooc$a      # 4

# same but proto overridden to force a to be specified
oop$proto <- function(., a) { .super$proto(., a=a) }
## Not run: 
##D ooc2 <- oop$proto() # Error. Argument "a" is missing, with no default.
## End(Not run)
ooc2 <- oop$proto(a = 10)
ooc2$incr()
ooc2$a # 11

# use of with to eliminate having to write .$a
o2 <- proto(a = 1, incr = function(.) with(., a <- a+1))
o2c <- as.proto(o2$as.list()) # o2c is a clone of o2
o2d <- o2$proto()  # o2d is a child of o2
o2$a <- 2
o2c$a  # a not changed by assignment in line above
o2d$a # a is changed since a not found in o2d so found in o2

p <- proto(a = 0, incr = function(., x) .$a <- .$a + x)
pc <- p$proto(a = 100)

p$incr(7)
p$incr(x=7)
p$a




