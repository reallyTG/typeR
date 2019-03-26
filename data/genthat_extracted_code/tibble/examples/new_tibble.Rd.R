library(tibble)


### Name: new_tibble
### Title: Tibble constructor and validator
### Aliases: new_tibble validate_tibble

### ** Examples

# The nrow argument is always required:
new_tibble(list(a = 1:3, b = 4:6), nrow = 3)

# Existing row.names attributes are ignored:
try(new_tibble(iris, nrow = 3))

# The length of all columns must be consistent with the nrow argument:
try(new_tibble(list(a = 1:3, b = 4:6), nrow = 2))



