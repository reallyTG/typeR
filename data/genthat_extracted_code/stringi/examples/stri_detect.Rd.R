library(stringi)


### Name: stri_detect
### Title: Detect a Pattern Match
### Aliases: stri_detect stri_detect_fixed stri_detect_charclass
###   stri_detect_coll stri_detect_regex

### ** Examples

stri_detect_fixed(c("stringi R", "R STRINGI", "123"), c('i', 'R', '0'))
stri_detect_fixed(c("stringi R", "R STRINGI", "123"), 'R')

stri_detect_charclass(c("stRRRingi","R STRINGI", "123"),
   c("\\p{Ll}", "\\p{Lu}", "\\p{Zs}"))

stri_detect_regex(c("stringi R", "R STRINGI", "123"), 'R.')
stri_detect_regex(c("stringi R", "R STRINGI", "123"), '[[:alpha:]]*?')
stri_detect_regex(c("stringi R", "R STRINGI", "123"), '[a-zC1]')
stri_detect_regex(c("stringi R", "R STRINGI", "123"), '( R|RE)')
stri_detect_regex("stringi", "STRING.", case_insensitive=TRUE)

stri_detect_regex(c("abc", "def", "123", "ghi", "456", "789", "jkl"),
   "^[0-9]+$", max_count=1)
stri_detect_regex(c("abc", "def", "123", "ghi", "456", "789", "jkl"),
   "^[0-9]+$", max_count=2)
stri_detect_regex(c("abc", "def", "123", "ghi", "456", "789", "jkl"),
   "^[0-9]+$", negate=TRUE, max_count=3)




