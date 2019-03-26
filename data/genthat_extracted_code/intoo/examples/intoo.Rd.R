library(intoo)


### Name: intoo
### Title: Attribute Operators
### Aliases: %$% %$%<- object.info

### ** Examples

obj1 = "My First Object"

obj1 %$% obj2a = "My Second Object"
obj1 %$% obj2b = 1:20
obj1 %$% obj2c = function (x) {x ^ 2}
obj1 %$% obj2d = rnorm (80)

obj1 %$% obj2d %$% obj3 = "Another Object"

obj1 %$% obj2d %$% obj3 %$% obj4 = "And Another Object"

obj1 %$% obj2a

object.info (obj1)
object.info (obj1 %$% obj2d)



