library(stringi)


### Name: stri_trans_general
### Title: General Text Transforms, Including Transliteration
### Aliases: stri_trans_general

### ** Examples

stri_trans_general("gro\u00df", "latin-ascii")
stri_trans_general("stringi", "latin-greek")
stri_trans_general("stringi", "latin-cyrillic")
stri_trans_general("stringi", "upper") # see stri_trans_toupper
stri_trans_general("\u0104", "nfd; lower") # compound id; see stri_trans_nfd
stri_trans_general("tato nie wraca ranki wieczory", "pl-pl_FONIPA")
stri_trans_general("\u2620", "any-name") # character name
stri_trans_general("\\N{latin small letter a}", "name-any") # decode name
stri_trans_general("\u2620", "hex") # to hex



