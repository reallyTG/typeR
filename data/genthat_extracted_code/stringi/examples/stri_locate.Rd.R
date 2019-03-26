library(stringi)


### Name: stri_locate_all
### Title: Locate Occurrences of a Pattern
### Aliases: stri_locate_all stri_locate_first stri_locate_last stri_locate
###   stri_locate_all_charclass stri_locate_first_charclass
###   stri_locate_last_charclass stri_locate_all_coll
###   stri_locate_first_coll stri_locate_last_coll stri_locate_all_regex
###   stri_locate_first_regex stri_locate_last_regex stri_locate_all_fixed
###   stri_locate_first_fixed stri_locate_last_fixed

### ** Examples

stri_locate_all('XaaaaX',
   regex=c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_locate_all('Bartolini', fixed='i')
stri_locate_all('a b c', charclass='\\p{Zs}') # all white spaces

stri_locate_all_charclass(c('AbcdeFgHijK', 'abc', 'ABC'), '\\p{Ll}')
stri_locate_all_charclass(c('AbcdeFgHijK', 'abc', 'ABC'), '\\p{Ll}', merge=FALSE)
stri_locate_first_charclass('AaBbCc', '\\p{Ll}')
stri_locate_last_charclass('AaBbCc', '\\p{Ll}')

stri_locate_all_coll(c('AaaaaaaA', 'AAAA'), 'a')
stri_locate_first_coll(c('Yy\u00FD', 'AAA'), 'y', strength=2, locale="sk_SK")
stri_locate_last_coll(c('Yy\u00FD', 'AAA'), 'y', strength=1, locale="sk_SK")

pat <- stri_paste("\u0635\u0644\u0649 \u0627\u0644\u0644\u0647 ",
                  "\u0639\u0644\u064a\u0647 \u0648\u0633\u0644\u0645XYZ")
stri_locate_last_coll("\ufdfa\ufdfa\ufdfaXYZ", pat, strength = 1)

stri_locate_all_fixed(c('AaaaaaaA', 'AAAA'), 'a')
stri_locate_all_fixed(c('AaaaaaaA', 'AAAA'), 'a', case_insensitive=TRUE, overlap=TRUE)
stri_locate_first_fixed(c('AaaaaaaA', 'aaa', 'AAA'), 'a')
stri_locate_last_fixed(c('AaaaaaaA', 'aaa', 'AAA'), 'a')

#first row is 1-2 like in locate_first
stri_locate_all_fixed('bbbbb', 'bb')
stri_locate_first_fixed('bbbbb', 'bb')

# but last row is 3-4, unlike in locate_last,
# keep this in mind [overlapping pattern match OK]!
stri_locate_last_fixed('bbbbb', 'bb')

stri_locate_all_regex('XaaaaX',
   c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_locate_first_regex('XaaaaX',
   c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))
stri_locate_last_regex('XaaaaX',
   c('\\p{Ll}', '\\p{Ll}+', '\\p{Ll}{2,3}', '\\p{Ll}{2,3}?'))

# Use regex positive-lookahead to locate overlapping pattern matches:
stri_locate_all_regex("ACAGAGACTTTAGATAGAGAAGA", "(?=AGA)")
# note that start > end here (match of 0 length)





