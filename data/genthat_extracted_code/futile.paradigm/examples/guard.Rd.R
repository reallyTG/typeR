library(futile.paradigm)


### Name: %when%
### Title: Add guards to a function to define the conditions when a child
###   function will execute
### Aliases: %when% %also% %as% %default% %isa% %hasa% %hasall% guards
###   variant rm.variant
### Keywords: methods programming

### ** Examples

# Note that these are trivial examples for pedagogical purposes. Due to their
# trivial nature, most of these examples can be implemented more concisely
# using built-in R features.


# The expression must operate on arguments declared in the concrete function.
logarithm %when% is.numeric(x)
logarithm %as% function(x) logarithm(x, exp(1))

# Defaults are applied on a per-argument length basis
logarithm %when% TRUE
logarithm %as% function(x) logarithm(as.numeric(x))

logarithm %when% is.numeric(x)
logarithm %also% is.numeric(y)
logarithm %as% function(x,y) log(x, base=y)

logarithm %when% TRUE
logarithm %as% function(x,y) logarithm(as.numeric(x), as.numeric(y))

logarithm %default% function(...) cat("This is the default function\n")

logarithm(100,10)
logarithm(5)
logarithm("5")
logarithm(6,7,8)

# View the function variants for this abstract function
guards(logarithm)

# In the futile.paradigm, the convention is to name types in PascalCase
a <- create(Apple, seeds=103)
a 
a 




