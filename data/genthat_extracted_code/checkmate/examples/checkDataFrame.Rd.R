library(checkmate)


### Name: checkDataFrame
### Title: Check if an argument is a data frame
### Aliases: checkDataFrame check_data_frame assertDataFrame
###   assert_data_frame testDataFrame test_data_frame expect_data_frame

### ** Examples

testDataFrame(iris)
testDataFrame(iris, types = c("numeric", "factor"), min.rows = 1, col.names = "named")



