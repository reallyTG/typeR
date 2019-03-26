library(types)


### Name: ?
### Title: Documentation Shortcuts
### Aliases: ?

### ** Examples

# Function arguments can be annotated with types
f <- function(x = 1 ? numeric) {
  x + 1
}

# Default arguments can also be annotated (the `=` is required however)
f <- function(x = ? numeric) {
  x + 1
}

# Function statements can be annotated with types
f <- function(x = "Yay") {
  paste(x, "types!") ? character
}

# Function return values can be annotated with types
f <- function(x = 1) {
  x 
} ? boolean



