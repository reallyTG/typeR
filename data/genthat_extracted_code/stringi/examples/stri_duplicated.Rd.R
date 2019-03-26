library(stringi)


### Name: stri_duplicated
### Title: Determine Duplicated Elements
### Aliases: stri_duplicated stri_duplicated_any

### ** Examples

# In the following examples, we have 3 duplicated values,
# "a" - 2 times, NA - 1 time
stri_duplicated(c("a", "b", "a", NA, "a", NA))
stri_duplicated(c("a", "b", "a", NA, "a", NA), fromLast=TRUE)
stri_duplicated_any(c("a", "b", "a", NA, "a", NA))

# compare the results:
stri_duplicated(c("\u0105", stri_trans_nfkd("\u0105")))
duplicated(c("\u0105", stri_trans_nfkd("\u0105")))

stri_duplicated(c("gro\u00df", "GROSS", "Gro\u00df", "Gross"), strength=1)
duplicated(c("gro\u00df", "GROSS", "Gro\u00df", "Gross"))




