library(lsasim)


### Name: booklet_sample
### Title: Assignment of test booklets to test takers
### Aliases: booklet_sample

### ** Examples

it_bk <- matrix(c(1, 2, 1, 4, 5, 4, 7, 8, 7, 10, 3, 10, 2, 6, 3, 5, 9, 6, 8, 0, 9), 
           ncol = 3, byrow = TRUE)
booklet_sample(n_subj = 10, book_item_design = it_bk, book_prob = c(.2, .5, .3))




