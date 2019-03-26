library(matsbyname)


### Name: sort_rows_cols
### Title: Sorts rows and columns of a matrix
### Aliases: sort_rows_cols

### ** Examples

m <- matrix(c(1:6), nrow=3, dimnames = list(c("r3", "r5", "r1"), c("c4", "c2")))
sort_rows_cols(m)
sort_rows_cols(t(m))
sort_rows_cols(m, margin=1) # Sorts rows
sort_rows_cols(m, margin=2) # Sorts columns
v <- matrix(c(1:5), ncol=1, dimnames=list(rev(paste0("r", 1:5)), "c1")) # Column vector
sort_rows_cols(v)
sort_rows_cols(v, margin = 1) # Sorts rows
sort_rows_cols(v, margin = 2) # No effect: only one column
r <- matrix(c(1:4), nrow=1, dimnames=list("r1", rev(paste0("c", 1:4)))) # Row vector
sort_rows_cols(r) # Sorts columns
n <- matrix(c(1,2), nrow = 1, dimnames = list(NULL, c("c2", "c1"))) # No row name
sort_rows_cols(n) # Sorts columns, because only one row.
# Also works with lists
sort_rows_cols(list(m,m)) # Sorts rows and columns for both m's.
# Sort rows only for first one, sort rows and columns for second one.  
# Row order is applied to all m's.  Column order is natural.
sort_rows_cols(a = list(m,m), margin = 1, roworder = c("r5", "r3", "r1"))
# Columns are sorted as default, because no colorder is given.
# roworder is ignored. 
sort_rows_cols(a = list(m,m), margin = 2, roworder = c("r5", "r3", "r1"))
# Both columns and rows sorted, rows by the list, columns in natural order.
sort_rows_cols(a = list(m,m), margin = c(1,2), roworder = c("r5", "r3", "r1"))



