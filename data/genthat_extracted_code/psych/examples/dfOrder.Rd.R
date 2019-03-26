library(psych)


### Name: dfOrder
### Title: Sort (order) a dataframe or matrix by multiple columns
### Aliases: dfOrder
### Keywords: manip utilities

### ** Examples

set.seed(42)
x <- matrix(sample(1:4,64,replace=TRUE),ncol=4)
dfOrder(x)  # sort by all columns
dfOrder(x,c(1,4))  #sort by the first and 4th column
x.df <- data.frame(x)
dfOrder(x.df,c(1,-2))  #sort by the first in increasing order, 
   #the second in decreasing order




