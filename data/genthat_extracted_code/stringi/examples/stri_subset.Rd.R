library(stringi)


### Name: stri_subset
### Title: Select Elements that Match a Given Pattern
### Aliases: stri_subset stri_subset<- stri_subset_fixed
###   stri_subset_fixed<- stri_subset_charclass stri_subset_charclass<-
###   stri_subset_coll stri_subset_coll<- stri_subset_regex
###   stri_subset_regex<-

### ** Examples

stri_subset_regex(c("stringi R", "123", "ID456", ""), "^[0-9]+$")

x <- c("stringi R", "123", "ID456", "")
stri_subset_regex(x, "[^0-9]+|^$") <- NA
print(x)

x <- c("stringi R", "123", "ID456", "")
stri_subset_regex(x, "^[0-9]+$", negate=TRUE) <- NA
print(x)




