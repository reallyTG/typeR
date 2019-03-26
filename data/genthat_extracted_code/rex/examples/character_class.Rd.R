library(rex)


### Name: character_class
### Title: Create character classes
### Aliases: character_class one_of any_of some_of none_of except
###   except_any_of except_some_of range : exclude_range

### ** Examples

# grey = gray
re <- rex("gr", one_of("a", "e"), "y")
grepl(re, c("grey", "gray")) # TRUE TRUE

# Match non-vowels
re <- rex(none_of("a", "e", "i", "o", "u"))
# They can also be in the same string
re <- rex(none_of("aeiou"))
grepl(re, c("k", "l", "e")) # TRUE TRUE FALSE

# Match range
re <- rex(range("a", "e"))
grepl(re, c("b", "d", "f")) # TRUE TRUE FALSE

# Explicit creation
re <- rex(character_class("abcd\\["))
grepl(re, c("a", "d", "[", "]")) # TRUE TRUE TRUE FALSE



