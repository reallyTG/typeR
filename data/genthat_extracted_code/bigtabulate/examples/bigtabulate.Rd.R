library(bigtabulate)


### Name: bigtabulate
### Title: Extended Tabular Operations for Both matrix and big.matrix
###   Objects
### Aliases: bigsplit bigtable bigtabulate bigtsummary

### ** Examples

data(iris)

# First, break up column 2 into 5 groups, and leave column 5 as a
# factor (which it is).  Note that iris is a data.frame, which is
# fine.  A matrix would also be fine.  A big.matrix would also be fine!
bigtable(iris, ccols=c(2, 5), breaks=list(5, NA))

iris[,2] <- round(iris[,2]) # So columns 2 and 5 will be factor-like
                            # for convenience in these examples, below:

ans1 <- bigtable(iris, c(2, 5))
ans1
# Same answer, but with nice factor labels from table(), because
# table() handles factors.  bigtable() uses the numeric factor
# levels only.
table(iris[,2], iris[,5])

# Here, our formulation is simpler than split's, and is faster and
# more memory-efficient:
ans2 <- bigsplit(iris, c(2, 5), splitcol=1)
ans2[1:3]
split(iris[,1], list(col2=factor(iris[,2]), col5=iris[,5]))[1:3]



