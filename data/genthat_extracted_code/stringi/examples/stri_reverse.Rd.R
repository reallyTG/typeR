library(stringi)


### Name: stri_reverse
### Title: Reverse Each String
### Aliases: stri_reverse

### ** Examples

stri_reverse(c("123", "abc d e f"))
stri_reverse("ZXY (\u0105\u0104123$^).")
stri_reverse(stri_trans_nfd('\u0105')) == stri_trans_nfd('\u0105') # A, ogonek -> agonek, A




