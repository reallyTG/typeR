library(wrapr)


### Name: as_dot_fn
### Title: Convert an unevaluted pipeline into a function.
### Aliases: as_dot_fn

### ** Examples


f <- as_dot_fn(sin(.) %.>% cos(.))
f(1:3)

g <- as_dot_fn(. %.>% sin(.) %.>% cos(.))
g(1:3)




