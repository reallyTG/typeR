library(cwhmisc)


### Name: clean.na
### Title: Clean a matrix or data frame of rows or columns of containing
###   NA.
### Aliases: clean.na
### Keywords: manip

### ** Examples

  x <- matrix(c(1,NA,2,5),2,2)
  clean.na(x,1)
#     [,1] [,2]
#[1,]    1    2
  clean.na(x,2,TRUE)
# [1] 2 5



