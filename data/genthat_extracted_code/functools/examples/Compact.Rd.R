library(functools)


### Name: Compact
### Title: Filter NA and NULL values out of a vector, list, or data.frame.
### Aliases: Compact

### ** Examples

# Removes all null elements from a vector:
a <- list(NULL, 1, 5, NULL)
Compact(a)

b <- c(1, 2, 0, 4, NULL, 1, 3, NULL)
Compact(b)



