library(utf8)


### Name: utf8_normalize
### Title: Text Normalization
### Aliases: utf8_normalize

### ** Examples

angstrom <- c("\u00c5", "\u0041\u030a", "\u212b")
utf8_normalize(angstrom) == "\u00c5"



