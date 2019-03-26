library(sjmisc)


### Name: empty_cols
### Title: Return or remove variables or observations that are completely
###   missing
### Aliases: empty_cols empty_rows remove_empty_cols remove_empty_rows

### ** Examples

tmp <- data.frame(a = c(1, 2, 3, NA, 5),
                  b = c(1, NA, 3, NA , 5),
                  c = c(NA, NA, NA, NA, NA),
                  d = c(1, NA, 3, NA, 5))

tmp

empty_cols(tmp)
empty_rows(tmp)

remove_empty_cols(tmp)
remove_empty_rows(tmp)




