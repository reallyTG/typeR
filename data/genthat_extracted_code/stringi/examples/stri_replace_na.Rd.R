library(stringi)


### Name: stri_replace_na
### Title: Replace Missing Values in a Character Vector
### Aliases: stri_replace_na

### ** Examples

x <- c('test', NA)
stri_paste(x, 1:2)                           # "test1" NA
paste(x, 1:2)                                # "test 1" "NA 2"
stri_paste(stri_replace_na(x), 1:2, sep=' ') # "test 1" "NA 2"




