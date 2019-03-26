library(reshape2)


### Name: colsplit
### Title: Split a vector into multiple columns
### Aliases: colsplit
### Keywords: manip

### ** Examples

x <- c("a_1", "a_2", "b_2", "c_3")
vars <- colsplit(x, "_", c("trt", "time"))
vars
str(vars)



