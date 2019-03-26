library(lambda.r)


### Name: %as%
### Title: Define functions and type constructors in lambda.r
### Aliases: %as% %:=% %::% EMPTY seal
### Keywords: methods programming

### ** Examples

# Type constraints are optional and include the return type as the 
# final type
reciprocal(x) %::% numeric : numeric
reciprocal(0) %as% stop("Division by 0 not allowed")

# The type constraint is still valid for this function clause
reciprocal(x) %when% {
  # Guard statements can be added in succession
  x != 0
  # Attributes can be accessed using '@' notation
  is.null(x@dummy.attribute)
} %as% {
  # This is the body of the function clause
  1 / x
}

# This new type constraint applies from this point on
reciprocal(x) %::% character : numeric
reciprocal(x) %as% {
  reciprocal(as.numeric(x))
}

# Seal the function so no new definitions are allowed
seal(reciprocal)

print(reciprocal)
reciprocal(4)
reciprocal("4")




