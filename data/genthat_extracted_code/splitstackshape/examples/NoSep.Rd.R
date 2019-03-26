library(splitstackshape)


### Name: NoSep
### Title: Split Basic Alphanumeric Strings Which Have No Separators
### Aliases: NoSep

### ** Examples


x <- paste0("Var", LETTERS[1:3], 1:3)
splitstackshape:::NoSep(x)

y <- paste0(1:3, "Var", LETTERS[1:3])
splitstackshape:::NoSep(y, charfirst = FALSE)




