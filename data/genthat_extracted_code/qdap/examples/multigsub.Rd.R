library(qdap)


### Name: multigsub
### Title: Multiple gsub
### Aliases: multigsub mgsub sub_holder

### ** Examples

## Not run: 
##D ## ======================
##D ##    `mgsub` Function
##D ## ======================
##D 
##D multigsub(c("it's", "I'm"), c("it is", "I am"), DATA$state)
##D mgsub(c("it's", "I'm"), c("it is", "I am"), DATA$state)
##D mgsub("[[:punct:]]", "PUNC", DATA$state, fixed = FALSE)
##D 
##D ## ====================== 
##D ## `sub_holder` Function
##D ## ======================
##D 
##D ## `alpha.type` as TRUE
##D (fake_dat <- paste(emoticon[1:11,2], DATA$state))
##D (m <- sub_holder(emoticon[,2], fake_dat))
##D m$unhold(strip(m$output))
##D # With Stemming
##D m$unhold(stemmer(strip(m$output), capitalize = FALSE))
##D 
##D ## `alpha.type` as FALSE (numeric keys)
##D vowels <- LETTERS[c(1, 5, 9, 15, 21)]
##D (m2 <- sub_holder(vowels, toupper(DATA$state), alpha.type = FALSE))
##D m2$unhold(gsub("[^0-9]", "", m2$output))
##D mtabulate(strsplit(m2$unhold(gsub("[^0-9]", "", m2$output)), ""))
## End(Not run)



