library(oppr)


### Name: tibble-methods
### Title: Manipulate tibbles
### Aliases: tibble-methods nrow,tbl_df-method ncol,tbl_df-method
###   as.list,tbl_df-method

### ** Examples

# load tibble package
require(tibble)

# make tibble
a <- tibble(value = seq_len(5))

# number of rows
nrow(a)

# number of columns
ncol(a)

# convert to list
as.list(a)



