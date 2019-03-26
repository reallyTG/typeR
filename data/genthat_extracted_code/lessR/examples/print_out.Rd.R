library(lessR)


### Name: print.out
### Title: Display a Portion of Output from a Saved List Object
### Aliases: print.out
### Keywords: print.out

### ** Examples

# read internal data set
d <- rd("Employee", in.lessR=TRUE, quiet=TRUE)
# do the summary statistics
s <- ss.brief(Salary)
# print the piece of output, print function is implicit
s$outliers



