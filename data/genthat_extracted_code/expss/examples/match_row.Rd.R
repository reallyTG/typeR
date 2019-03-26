library(expss)


### Name: match_row
### Title: Match finds value in rows or columns/index returns value by
###   index from rows or columns
### Aliases: match_row match_col index_row index_col

### ** Examples

# toy data
v1 = 1:3
v2 = 2:4
v3 = 7:5

# postions of 1,3,5 in rows
match_row(c(1, 3, 5), v1, v2, v3) # 1:3
# postions of 1,3,5 in columns
match_col(1, v1, v2, v3) # c(v1 = 1, v2 = NA, v3 = NA)

# postion of first value greater than 2
ix = match_row(gt(2), v1, v2, v3) 
ix # c(3,2,1)
# return values by result of previous 'match_row' 
index_row(ix, v1, v2, v3) # c(7,3,3)

# the same actions with data.frame
dfs = data.frame(v1, v2, v3)

# postions of 1,3,5 in rows
match_row(c(1, 3, 5), dfs) # 1:3
# postions of 1,3,5 in columns
match_col(1, dfs) # c(v1 = 1, v2 = NA, v3 = NA)

# postion of first value greater than 2
ix = match_row(gt(2), dfs) 
ix # c(3,2,1)
# return values by result of previous 'match_row' 
index_row(ix, dfs) # c(7,3,3)



