library(stringi)


### Name: stri_sub
### Title: Extract a Substring From or Replace a Substring In a Character
###   Vector
### Aliases: stri_sub stri_sub<- stri_sub_replace

### ** Examples

s <- "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
stri_sub(s, from=1:3*6, to=21)
stri_sub(s, from=c(1,7,13), length=5)
stri_sub(s, from=1, length=1:3)
stri_sub(s, -17, -7)
stri_sub(s, -5, length=4)
(stri_sub(s, 1, 5) <- "stringi")
(stri_sub(s, -6, length=5) <- ".")
(stri_sub(s, 1, 1:3) <- 1:2)

x <- c("a;b", "c:d")
(stri_sub(x, stri_locate_first_fixed(x, ";"), omit_na=TRUE) <- "_")

## Not run: x %>% stri_sub_replace(1, 5, value="new_substring")



