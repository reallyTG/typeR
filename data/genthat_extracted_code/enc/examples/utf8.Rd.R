library(enc)


### Name: utf8
### Title: A simple class for storing UTF-8 strings
### Aliases: utf8 is_utf8 as_utf8 as_utf8.default as_utf8.NULL
###   as_utf8.character as_utf8.utf8 as.character.utf8 as.data.frame.utf8
###   format.utf8 print.utf8

### ** Examples

utf8(letters)
utf8("ä")
utf8(iconv("ä", to = "latin1"))



