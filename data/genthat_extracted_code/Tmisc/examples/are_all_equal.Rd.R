library(Tmisc)


### Name: are_all_equal
### Title: Are all equal?
### Aliases: are_all_equal
### Keywords: keywords

### ** Examples

are_all_equal(c(5,5,5))
are_all_equal(c(5,5,5,6))
are_all_equal(c(5,5,5,NA,6))
are_all_equal(c(5,5,5,NA,6), na.rm=TRUE)
5==5.000000001
identical(5, 5.000000001)
are_all_equal(c(5L, 5, 5.000000001))




