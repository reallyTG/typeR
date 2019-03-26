library(lsasim)


### Name: booklet_design
### Title: Assignment of item blocks to test booklets
### Aliases: booklet_design

### ** Examples

i_blk_mat <- matrix(seq(1:40), ncol = 5) 
blk_book <- matrix(c(1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1,
                     0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0), 
                     ncol = 5, byrow = TRUE)
booklet_design(item_block_assignment = i_blk_mat, book_design = blk_book)
booklet_design(item_block_assignment = i_blk_mat)




