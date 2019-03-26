library(maditr)


### Name: coalesce
### Title: Return first non-missing element
### Aliases: coalesce

### ** Examples

# examples from dplyr
x = sample(c(1:5, NA, NA, NA))
coalesce(x, 0L)

y = c(1, 2, NA, NA, 5)
z = c(NA, NA, 3, 4, 5)
coalesce(y, z)



