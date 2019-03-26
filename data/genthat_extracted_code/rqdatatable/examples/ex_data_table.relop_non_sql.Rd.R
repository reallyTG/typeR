library(rqdatatable)


### Name: ex_data_table.relop_non_sql
### Title: Direct non-sql (function) node, not implemented for 'data.table'
###   case.
### Aliases: ex_data_table.relop_non_sql

### ** Examples


set.seed(3252)
d <- data.frame(a = rnorm(1000), b = rnorm(1000))

optree <- local_td(d) %.>%
  quantile_node(.)
ex_data_table(optree)

p2 <- local_td(d) %.>%
  rsummary_node(.)
ex_data_table(p2)

summary(d)




