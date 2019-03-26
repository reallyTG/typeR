library(tidyimpute)


### Name: drop_rows_all_na
### Title: drop_rows_all_na, drop_rows_any_na
### Aliases: drop_rows_all_na filter_all_na drop_rows_any_na filter_any_na

### ** Examples


  data(iris)
  
  .tbl <- iris[1:5,]
  .tbl[1:2,] <- NA
  .tbl[3,1] <- NA
  .tbl
  
  filter_all_na(.tbl) 
  filter_any_na(.tbl)
  
  drop_rows_all_na(.tbl)
  drop_rows_any_na(.tbl)
  



