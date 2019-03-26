library(rlang)


### Name: chr_unserialise_unicode
### Title: Translate unicode points to UTF-8
### Aliases: chr_unserialise_unicode
### Keywords: internal

### ** Examples

ascii <- "<U+5E78>"
chr_unserialise_unicode(ascii)

identical(chr_unserialise_unicode(ascii), "\u5e78")



