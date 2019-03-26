library(purrr)


### Name: list_modify
### Title: Modify a list
### Aliases: list_modify list_merge update_list

### ** Examples

x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
str(x)

# Update values
str(list_modify(x, a = 1))
# Replace values
str(list_modify(x, z = 5))
str(list_modify(x, z = list(a = 1:5)))

# Remove values
str(list_modify(x, z = zap()))

# Combine values
str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))


# All these functions support tidy dots features. Use !!! to splice
# a list of arguments:
l <- list(new = 1, y = zap(), z = 5)
str(list_modify(x, !!!l))



