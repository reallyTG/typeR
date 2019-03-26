library(stringi)


### Name: stri_count
### Title: Count the Number of Pattern Matches
### Aliases: stri_count stri_count_charclass stri_count_coll
###   stri_count_fixed stri_count_regex

### ** Examples

s <- "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
stri_count(s, fixed="dolor")
stri_count(s, regex="\\p{L}+")

stri_count_fixed(s, " ")
stri_count_fixed(s, "o")
stri_count_fixed(s, "it")
stri_count_fixed(s, letters)
stri_count_fixed("babab", "b")
stri_count_fixed(c("stringi", "123"), "string")

stri_count_charclass(c("stRRRingi", "STrrrINGI", "123"),
   c("\\p{Ll}", "\\p{Lu}", "\\p{Zs}"))
stri_count_charclass(" \t\n", "\\p{WHITE_SPACE}") # white space - binary property
stri_count_charclass(" \t\n", "\\p{Z}") # white-space - general category (note the difference)

stri_count_regex(s, "(s|el)it")
stri_count_regex(s, "i.i")
stri_count_regex(s, ".it")
stri_count_regex("bab baab baaab", c("b.*?b", "b.b"))
stri_count_regex(c("stringi", "123"), "^(s|1)")




