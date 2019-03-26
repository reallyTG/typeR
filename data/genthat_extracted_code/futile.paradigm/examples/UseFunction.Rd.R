library(futile.paradigm)


### Name: UseFunction
### Title: Primary dispatcher for functional programming
### Aliases: UseFunction
### Keywords: methods programming

### ** Examples

# Note that these are trivial examples for pedagogical purposes. Due to their
# trivial nature, most of these examples can be implemented more concisely
# using built-in R features.

# Optional
#reciprocal <- function(...) UseFunction('reciprocal', ...)

reciprocal %when% is.numeric(x)
reciprocal %also% (x != 0)
reciprocal %must% (sign(result) == sign(x))
reciprocal %as% function(x) 1 / x

reciprocal %when% is.character(x)
reciprocal %as% function(x) reciprocal(as.numeric(x))

print(reciprocal)
reciprocal(4)




