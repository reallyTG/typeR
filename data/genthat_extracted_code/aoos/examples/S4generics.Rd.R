library(aoos)


### Name: %g%
### Title: Wrapper for writing S4 generics and methods
### Aliases: %g% %m%

### ** Examples

# A new generic function and a method:
numeric : generic(x) %g% standardGeneric("generic") 
generic(x ~ numeric) %m% x
generic(1)

# Polymorphic methods in an object:
Object <- function() {
  numeric : generic(x) %g% standardGeneric("generic") 
  generic(x ~ numeric) %m% x
  retList("Object")
}
Object()$generic(1)

# Class Unions:
## This generic allows for return values of type numeric or character:
'numeric | character' : generic(x) %g% standardGeneric("generic")

## This method also allows for numeric or character as argument:
generic(x ~ character | numeric) %m% x
generic(1)
generic("")




