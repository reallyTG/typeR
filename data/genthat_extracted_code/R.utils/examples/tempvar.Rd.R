library(R.utils)


### Name: tempvar
### Title: Gets a unique non-existing temporary variable name
### Aliases: tempvar
### Keywords: programming internal

### ** Examples

# Get a temporary variable
name <- tempvar()
print(name)

# Get and assign a temporary variable
name <- tempvar(value=base::letters)
print(name)
str(get(name))

# Get a temporary variable with custom prefix
name <- tempvar(prefix=".hidden")
print(name)



