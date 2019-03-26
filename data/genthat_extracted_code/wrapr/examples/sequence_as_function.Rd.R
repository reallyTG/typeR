library(wrapr)


### Name: sequence_as_function
### Title: Convert a sequence of expressions into a function.
### Aliases: sequence_as_function

### ** Examples


seq <- Collector() %.>% paste(., "a") %.>% paste(., "b")
f <- sequence_as_function(seq)
f("x")




