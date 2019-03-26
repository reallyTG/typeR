library(stringi)


### Name: stri_trans_tolower
### Title: Transform Strings with Case Mapping
### Aliases: stri_trans_tolower stri_trans_toupper stri_trans_totitle

### ** Examples

stri_trans_toupper("\u00DF", "de_DE") # small German Eszett / scharfes S
stri_cmp_eq(stri_trans_toupper("i", "en_US"), stri_trans_toupper("i", "tr_TR"))
stri_trans_toupper(c('abc', '123', '\u0105\u0104'))
stri_trans_tolower(c('AbC', '123', '\u0105\u0104'))
stri_trans_totitle(c('AbC', '123', '\u0105\u0104'))
stri_trans_totitle("GOOD-OLD cOOkiE mOnSTeR IS watCHinG You. Here HE comes!") # word boundary
stri_trans_totitle("GOOD-OLD cOOkiE mOnSTeR IS watCHinG You. Here HE comes!", type="sentence")



