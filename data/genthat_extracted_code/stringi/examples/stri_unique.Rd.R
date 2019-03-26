library(stringi)


### Name: stri_unique
### Title: Extract Unique Elements
### Aliases: stri_unique

### ** Examples

# normalized and non-Unicode-normalized version of the same code point:
stri_unique(c("\u0105", stri_trans_nfkd("\u0105")))
unique(c("\u0105", stri_trans_nfkd("\u0105")))

stri_unique(c("gro\u00df", "GROSS", "Gro\u00df", "Gross"), strength=1)




