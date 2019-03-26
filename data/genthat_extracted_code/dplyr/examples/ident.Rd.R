library(dplyr)


### Name: ident
### Title: Flag a character vector as SQL identifiers
### Aliases: ident

### ** Examples

# Identifiers are escaped with "
if (requireNamespace("dbplyr", quietly = TRUE)) {
  ident("x")
}



