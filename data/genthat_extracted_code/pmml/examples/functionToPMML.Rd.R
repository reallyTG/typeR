library(pmml)


### Name: functionToPMML
### Title: Convert an R expression to PMML.
### Aliases: functionToPMML

### ** Examples


# Operator precedence and parenthesis
functionToPMML("1 + 3/5 - (4 * 2)")

# Nested arbitrary functions
functionToPMML("foo(bar(x)) - bar(foo(y-z))")

# If-else expression
functionToPMML("if (x==3) { 3 } else { 0 }")

# Function with string argument types
functionToPMML("colors('red','green','blue')")

# Sign in front of expression
functionToPMML("-(x/y)")



