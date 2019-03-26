library(stringi)


### Name: stri_extract_all
### Title: Extract Occurrences of a Pattern
### Aliases: stri_extract_all stri_extract_first stri_extract_last
###   stri_extract stri_extract_all_charclass stri_extract_first_charclass
###   stri_extract_last_charclass stri_extract_all_coll
###   stri_extract_first_coll stri_extract_last_coll stri_extract_all_regex
###   stri_extract_first_regex stri_extract_last_regex
###   stri_extract_all_fixed stri_extract_first_fixed
###   stri_extract_last_fixed

### ** Examples

stri_extract_all('XaaaaX', regex=c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_extract_all('Bartolini', coll='i')
stri_extract_all('stringi is so good!', charclass='\\p{Zs}') # all white-spaces

stri_extract_all_charclass(c('AbcdeFgHijK', 'abc', 'ABC'), '\\p{Ll}')
stri_extract_all_charclass(c('AbcdeFgHijK', 'abc', 'ABC'), '\\p{Ll}', merge=FALSE)
stri_extract_first_charclass('AaBbCc', '\\p{Ll}')
stri_extract_last_charclass('AaBbCc', '\\p{Ll}')

## Not run: 
##D # emoji support available since ICU 57
##D stri_extract_all_charclass(stri_enc_fromutf32(32:55200), "\\p{EMOJI}")
## End(Not run)

stri_extract_all_coll(c('AaaaaaaA', 'AAAA'), 'a')
stri_extract_first_coll(c('Yy\u00FD', 'AAA'), 'y', strength=2, locale="sk_SK")
stri_extract_last_coll(c('Yy\u00FD', 'AAA'), 'y',  strength=1, locale="sk_SK")

stri_extract_all_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_extract_first_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_extract_last_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))

stri_list2matrix(stri_extract_all_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+')))
stri_extract_all_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+'), simplify=TRUE)
stri_extract_all_regex('XaaaaX', c('\\p{Ll}', '\\p{Ll}+'), simplify=NA)

stri_extract_all_fixed("abaBAba", "Aba", case_insensitive=TRUE)
stri_extract_all_fixed("abaBAba", "Aba", case_insensitive=TRUE, overlap=TRUE)




