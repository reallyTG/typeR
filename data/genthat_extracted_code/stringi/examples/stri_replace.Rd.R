library(stringi)


### Name: stri_replace_all
### Title: Replace Occurrences of a Pattern
### Aliases: stri_replace_all stri_replace_first stri_replace_last
###   stri_replace stri_replace_all_charclass stri_replace_first_charclass
###   stri_replace_last_charclass stri_replace_all_coll
###   stri_replace_first_coll stri_replace_last_coll stri_replace_all_fixed
###   stri_replace_first_fixed stri_replace_last_fixed
###   stri_replace_all_regex stri_replace_first_regex
###   stri_replace_last_regex

### ** Examples

stri_replace_all_charclass("aaaa", "[a]", "b", merge=c(TRUE, FALSE))

stri_replace_all_charclass("a\nb\tc   d", "\\p{WHITE_SPACE}", " ")
stri_replace_all_charclass("a\nb\tc   d", "\\p{WHITE_SPACE}", " ", merge=TRUE)

s <- "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
stri_replace_all_fixed(s, " ", "#")
stri_replace_all_fixed(s, "o", "0")

stri_replace_all_fixed(c("1", "NULL", "3"), "NULL", NA)

stri_replace_all_regex(s, " .*? ", "#")
stri_replace_all_regex(s, "(el|s)it", "1234")
stri_replace_all_regex('abaca', 'a', c('!', '*'))
stri_replace_all_regex('123|456|789', '(\\p{N}).(\\p{N})', '$2-$1')
stri_replace_all_regex(c("stringi R", "REXAMINE", "123"), '( R|R.)', ' r ')

## Not run: 
##D # named capture groups available since ICU 55
##D stri_replace_all_regex("words 123 and numbers 456",
##D    "(?<numbers>[0-9]+)", "!${numbers}!")
## End(Not run)

# Compare the results:
stri_replace_all_fixed("The quick brown fox jumped over the lazy dog.",
     c("quick", "brown", "fox"), c("slow",  "black", "bear"), vectorize_all=TRUE)
stri_replace_all_fixed("The quick brown fox jumped over the lazy dog.",
     c("quick", "brown", "fox"), c("slow",  "black", "bear"), vectorize_all=FALSE)

# Compare the results:
stri_replace_all_fixed("The quicker brown fox jumped over the lazy dog.",
     c("quick", "brown", "fox"), c("slow",  "black", "bear"), vectorize_all=FALSE)
stri_replace_all_regex("The quicker brown fox jumped over the lazy dog.",
     "\\b"%s+%c("quick", "brown", "fox")%s+%"\\b", c("slow",  "black", "bear"), vectorize_all=FALSE)




