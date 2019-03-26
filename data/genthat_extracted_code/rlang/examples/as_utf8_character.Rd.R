library(rlang)


### Name: as_utf8_character
### Title: Coerce to a character vector and attempt encoding conversion
### Aliases: as_utf8_character as_native_character as_utf8_string
###   as_native_string

### ** Examples

# Let's create a string marked as UTF-8 (which is guaranteed by the
# Unicode escaping in the string):
utf8 <- "caf\uE9"
str_encoding(utf8)
as_bytes(utf8)

# It can then be converted to a native encoding, that is, the
# encoding specified in the current locale:
## Not run: 
##D mut_latin1_locale()
##D latin1 <- as_native_string(utf8)
##D str_encoding(latin1)
##D as_bytes(latin1)
## End(Not run)



