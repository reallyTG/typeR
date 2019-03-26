library(lsasim)


### Name: block_design
### Title: Assignment of test items to blocks
### Aliases: block_design

### ** Examples

item_param <- data.frame(item = seq(1:25), b = runif(25, -2, 2))
ib_matrix <- matrix(nrow = 25, ncol = 5, byrow = FALSE, 
  c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1))
block_design(n_blocks = 5, item_parameters = item_param, item_block_matrix = ib_matrix)
block_design(n_blocks = 5, item_parameters = item_param)




