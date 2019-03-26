library(hutils)


### Name: set_cols_first
### Title: Put columns first or last
### Aliases: set_cols_first set_cols_last set_colsuborder

### ** Examples


library(data.table)
  
DT <- data.table(y = 1:5, z = 11:15, x = letters[1:5])
set_cols_first(DT, "x")[]
set_cols_last(DT, "x")[]
set_colsuborder(DT, c("x", "y"))[]




