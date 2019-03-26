library(lazysql)


### Name: date_between
### Title: Create SQL string to select date between two given dates
### Aliases: date_between

### ** Examples

date1 <- as.Date("2016-02-22")
date2 <- as.Date("2016-02-11")

# SQL expression for a date range
(sql_expr1 <- lazysql::date_between("STD_1", c(date1, date2)))

# SQL expression for a single date
(sql_expr2 <- lazysql::date_between("STD_1", date1))

# sample SQL statements
paste("select * from TEST_TABLE where", sql_expr1)

paste("select * from TEST_TABLE where", sql_expr2)




