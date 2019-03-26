library(rqdatatable)


### Name: ex_data_table
### Title: Execute an 'rquery' pipeline with 'data.table' sources.
### Aliases: ex_data_table

### ** Examples


  a <- data.table::data.table(x = c(1, 2) , y = c(20, 30), z = c(300, 400))
  optree <- local_td(a) %.>%
     select_columns(., c("x", "y")) %.>%
     select_rows_nse(., x<2 & y<30)
  cat(format(optree))
  ex_data_table(optree)

  # other ways to execute the pipeline include
  as.data.frame(optree)
  as.data.table(optree)
  data.frame(x = 0, y = 4, z = 400) %.>% optree





