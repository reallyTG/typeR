library(sodium)


### Name: Sodium utilities
### Title: Sodium Utilities
### Aliases: 'Sodium utilities' bin2hex helpers hex2bin random

### ** Examples

# Convert raw to hex string and back
test <- charToRaw("test 123")
x <- bin2hex(test)
y <- hex2bin(x)
stopifnot(identical(test, y))
stopifnot(identical(x, paste(test, collapse = "")))

# Parse text with characters
x2 <- paste(test, collapse = ":")
y2 <- hex2bin(x2, ignore = ":")
stopifnot(identical(test, y2))



