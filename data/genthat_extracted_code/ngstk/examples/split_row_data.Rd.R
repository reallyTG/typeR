library(ngstk)


### Name: split_row_data
### Title: Data split function by row
### Aliases: split_row_data

### ** Examples

x1 <- data.frame(col1 = 1:10, col2 = 11:20)
x2 <- data.frame(col1 = 1:99, col2 = 101:199)
x <- split_row_data(x1, sections = 1)
x <- split_row_data(x1, sections = 2)
x <- split_row_data(x1, sections = 3)
x <- split_row_data(x1, sections = 4)
x <- split_row_data(x2, sections = 2)
x <- split_row_data(x2, sections = 3)



