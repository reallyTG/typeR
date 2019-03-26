library(stringi)


### Name: stri_rand_shuffle
### Title: Randomly Shuffle Code Points in Each String
### Aliases: stri_rand_shuffle

### ** Examples

stri_rand_shuffle(c("abcdefghi", "0123456789"))
# you can do better than this with stri_rand_strings:
stri_rand_shuffle(rep(stri_paste(letters, collapse=''), 10))




