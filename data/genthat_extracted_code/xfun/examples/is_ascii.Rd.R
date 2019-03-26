library(xfun)


### Name: is_ascii
### Title: Check if a character vector consists of entirely ASCII
###   characters
### Aliases: is_ascii

### ** Examples

library(xfun)
is_ascii(letters)  # yes
is_ascii(intToUtf8(8212))  # no



