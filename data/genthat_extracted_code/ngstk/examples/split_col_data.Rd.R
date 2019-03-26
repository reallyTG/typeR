library(ngstk)


### Name: split_col_data
### Title: Data split function by colum
### Aliases: split_col_data

### ** Examples

x1 <- data.frame(col1 = 1:10, col2 = 11:20)
x1.t <- t(x1)
x <- split_col_data(x1.t, sections = 3)



