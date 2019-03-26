library(stringr)


### Name: str_conv
### Title: Specify the encoding of a string.
### Aliases: str_conv

### ** Examples

# Example from encoding?stringi::stringi
x <- rawToChar(as.raw(177))
x
str_conv(x, "ISO-8859-2") # Polish "a with ogonek"
str_conv(x, "ISO-8859-1") # Plus-minus



