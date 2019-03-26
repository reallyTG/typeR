library(checkmate)


### Name: checkDataTable
### Title: Check if an argument is a data table
### Aliases: checkDataTable check_data_table assertDataTable
###   assert_data_table testDataTable test_data_table expect_data_table

### ** Examples

library(data.table)
dt = as.data.table(iris)
setkeyv(dt, "Species")
setkeyv(dt, "Sepal.Length", physical = FALSE)
testDataTable(dt)
testDataTable(dt, key = "Species", index = "Sepal.Length", any.missing = FALSE)



