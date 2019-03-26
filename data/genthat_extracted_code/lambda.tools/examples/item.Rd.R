library(lambda.tools)


### Name: item
### Title: Safely get an element from a vector
### Aliases: item

### ** Examples

# Compare default behavior with item
(1:10)[NA]
item(1:10, NA)

# Negative indices are still allowed
item(1:10, -2) 



