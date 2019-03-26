library(rqdatatable)


### Name: ex_data_table.relop_set_indicator
### Title: Implement set_indicatoroperator.
### Aliases: ex_data_table.relop_set_indicator

### ** Examples


d <- data.frame(a = c("1", "2", "1", "3"),
                b = c("1", "1", "3", "2"),
                q = 1,
                stringsAsFactors = FALSE)
set <- c("1", "2")
op_tree <- local_td(d) %.>%
  set_indicator(., "one_two", "a", set) %.>%
  set_indicator(., "z", "a", c())
ex_data_table(op_tree)





