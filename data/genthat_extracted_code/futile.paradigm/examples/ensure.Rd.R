library(futile.paradigm)


### Name: %must%
### Title: Add post-assertion validations to a function to define the
###   conditions when results of a child function are valid
### Aliases: %must% ensures
### Keywords: methods programming

### ** Examples

# Note that these are trivial examples for pedagogical purposes. Due to their
# trivial nature, most of these examples can be implemented more concisely
# using built-in R features.


# The expression must operate on arguments declared in the concrete function.
logarithm %when% is.numeric(x)
logarithm %as% function(x) logarithm(x, exp(1))

# Explicit form (only necessary for special cases)
logarithm %when% is.numeric(x)
logarithm %also% is.numeric(y)
logarithm %must% (! is.nan(result) && ! is.infinite(result))
logarithm %as% function(x,y) log(x, base=y)

logarithm %when% TRUE
logarithm %as% function(x,y) logarithm(as.numeric(x), as.numeric(y))

logarithm(5)

# Uses all arguments in assertion
f %when% (is.numeric(a) & is.numeric(b) & b > 1)
f %must% (result == a + b)
f %as% function(a,b) a + b

f(2,3)

# View the function variants for this abstract function
ensures(logarithm)




