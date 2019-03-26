library(textclean)


### Name: sub_holder
### Title: Hold the Place of Characters Prior to Subbing
### Aliases: sub_holder

### ** Examples

## `alpha.type` as TRUE
library(lexicon); library(textshape)
(fake_dat <- paste(hash_emoticons[1:11, 1, with=FALSE][[1]], DATA$state))
(m <- sub_holder(fake_dat, hash_emoticons[[1]]))
m$unhold(strip(m$output))

## `alpha.type` as FALSE (numeric keys)
vowels <- LETTERS[c(1, 5, 9, 15, 21)]
(m2 <- sub_holder(toupper(DATA$state), vowels, alpha.type = FALSE))
m2$unhold(gsub("[^0-9]", "", m2$output))
mtabulate(strsplit(m2$unhold(gsub("[^0-9]", "", m2$output)), ""))



