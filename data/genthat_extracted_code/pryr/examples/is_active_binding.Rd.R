library(pryr)


### Name: is_active_binding
### Title: Active binding info
### Aliases: is_active_binding

### ** Examples

x <- 10
is_active_binding(x)
x %<a-% runif(1)
is_active_binding(x)
y <- x
is_active_binding(y)



