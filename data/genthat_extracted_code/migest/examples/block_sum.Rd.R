library(migest)


### Name: block_sum
### Title: Sum of Selected Block in a Block Matrix
### Aliases: block_sum

### ** Examples

m <- matrix(data = 100:220, nrow = 11, ncol = 11)
b <- block_matrix(x = 1:16, b = c(2, 3, 4, 2))
block_sum(block = 1, m = m, block_id = b)
block_sum(block = 4, m = m, block_id = b)
block_sum(block = 16, m = m, block_id = b)



