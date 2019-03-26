library(hutils)


### Name: drop_col
### Title: Drop column or columns
### Aliases: drop_col drop_cols

### ** Examples

if (requireNamespace("data.table", quietly = TRUE)) {
  library(data.table)
  DT <- data.table(x = 1, y = 2, z = 3)
  
  drop_col(DT, "x")
}




