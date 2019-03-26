library(lazysql)


### Name: natural_key
### Title: Create SQL string for joining on matching natural keys
### Aliases: natural_key

### ** Examples

# SQL expression
(sql_expr <- lazysql::natural_key(c("TAB1", "tab_2"),c("COL1", "col_2")))

# sample SQL JOIN statement
paste("select * from TAB1, TAB2 where", sql_expr)




