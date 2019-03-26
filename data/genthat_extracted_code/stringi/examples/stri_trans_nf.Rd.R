library(stringi)


### Name: stri_trans_nfc
### Title: Perform or Check For Unicode Normalization
### Aliases: stri_trans_nfc stri_trans_nfd stri_trans_nfkd stri_trans_nfkc
###   stri_trans_nfkc_casefold stri_trans_isnfc stri_trans_isnfd
###   stri_trans_isnfkd stri_trans_isnfkc stri_trans_isnfkc_casefold

### ** Examples

stri_trans_nfd("\u0105") # Polish a with ogonek -> a, ogonek
stri_trans_nfkc("\ufdfa") # 1 codepoint -> 18 codepoints




