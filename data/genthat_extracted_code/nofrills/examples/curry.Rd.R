library(nofrills)


### Name: curry
### Title: Curry a function
### Aliases: curry curry_fn

### ** Examples

curry(function(x, y, z = 0) x + y + z)
double <- curry(`*`)(2)
double(3)  # 6

curry_fn(x, y, z = 0 ~ x + y + z)
curry_fn(target, ... ~ identical(target, ...))

## Delay unquoting to embed argument values into the innermost function
compare_to <- curry_fn(target, x ~ identical(x, QUQ(target)))
is_this <- compare_to("this")
is_this("that")  # FALSE
is_this("this")  # TRUE
classify_as <- curry_fn(class, x ~ `class<-`(x, QUQ(class)))
as_this <- classify_as("this")
as_this("Some object")  # String of class "this"




