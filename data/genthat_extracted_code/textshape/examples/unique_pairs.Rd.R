library(textshape)


### Name: unique_pairs
### Title: Extract Only Unique Pairs of Collocating Words in
###   'tidy_colo_dtm'
### Aliases: unique_pairs unique_pairs.default unique_pairs.data.table

### ** Examples

dat <- data.frame(
    term_1 = LETTERS[1:10],
    term_2 = LETTERS[10:1],
    stringsAsFactors = FALSE
)

unique_pairs(dat)



