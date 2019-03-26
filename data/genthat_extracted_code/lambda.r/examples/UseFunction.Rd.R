library(lambda.r)


### Name: UseFunction
### Title: Primary dispatcher for functional programming
### Aliases: UseFunction NewObject
### Keywords: methods programming

### ** Examples

# Note that these are trivial examples for pedagogical purposes. Due to their
# trivial nature, most of these examples can be implemented more concisely
# using built-in R features.


reciprocal(x) %::% numeric : numeric
reciprocal(x) %when% {
  x != 0
} %as% {
  1 / x
}

reciprocal(x) %::% character : numeric
reciprocal(x) %as% {
  reciprocal(as.numeric(x))
}

seal(reciprocal)

print(reciprocal)
reciprocal(4)
reciprocal("4")




