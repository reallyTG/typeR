library(rJava)


### Name: JavaAccess
### Title: Field/method operator for Java objects
### Aliases: $,jobjRef-method $,jclassName-method $<-,jobjRef-method
###   $<-,jclassName-method names,jobjRef-method names,jclassName-method
###   names,jarrayRef-method names,jrectRef-method .DollarNames.jobjRef
###   .DollarNames.jclassName .DollarNames.jarrayRef .DollarNames.jrectRef
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)

v <- new(J("java.lang.String"), "Hello World!")
v$length()
v$indexOf("World")
names(v)

## Don't show: 
stopifnot( v$length() == 12L )
stopifnot( v$indexOf("World") == 6L ) 
## End(Don't show)

J("java.lang.String")$valueOf(10)

Double <- J("java.lang.Double")
# the class pseudo field - instance of Class for the associated class
# similar to java Double.class
Double$class 
## Don't show: 
	stopifnot( Double$class$getName() == "java.lang.Double" )
## End(Don't show)




