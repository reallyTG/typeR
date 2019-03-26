library(FAwR)


### Name: show.cols.with.na
### Title: Identifies variables in a dataframe that have missing values,
###   along with a count.
### Aliases: show.cols.with.na
### Keywords: manip

### ** Examples


test <- data.frame(a = c(1,2), b = c(3,4))
show.cols.with.na(test)
is.na(test$a[2]) <- TRUE
show.cols.with.na(test)




