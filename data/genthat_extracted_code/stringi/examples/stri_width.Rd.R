library(stringi)


### Name: stri_width
### Title: Determine the Width of Code Points
### Aliases: stri_width

### ** Examples

stri_width(LETTERS[1:5])
stri_width(stri_trans_nfkd("\u0105"))
stri_width( # Full-width equivalents of ASCII characters:
   stri_enc_fromutf32(as.list(c(0x3000, 0xFF01:0xFF5E)))
)
stri_width(stri_trans_nfkd("\ubc1f")) # includes Hangul Jamo medial vowels and final consonants



