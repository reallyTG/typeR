library(turner)


### Name: df_to_blocks
### Title: Split a data frame into blocks
### Aliases: df_to_blocks

### ** Examples

# say you have a data frame
iris_df = iris[c(1:3,51:53,101:103),]

# list defining the blocks
row_blocks = list(1:3, 4:6, 7:9)
col_blocks = c(2, 2, 1)

# split data into list of blocks (by rows)
df_to_blocks(iris_df, row_blocks)

# split data into list of blocks (by columns)
df_to_blocks(iris_df, col_blocks, byrow=FALSE)



