library(FuzzyAHP)


### Name: insertInto
### Title: Function that inserts FuzzyData on specific column number in
###   another FuzzyData
### Aliases: insertInto insertInto,FuzzyData,FuzzyData-method
###   insertInto,FuzzyData,FuzzyData,integer-method

### ** Examples

values = (c(1,2,3,4,5,6,7,8,9))
values = matrix(values, nrow = 3, ncol = 3, byrow = TRUE)
fData = fuzzyData(values, single.value = FALSE)

v = (c(15,16,17))
v = matrix(v, nrow = 3, ncol = 1, byrow = TRUE)
fd = fuzzyData(v, single.value = FALSE)

fData = insertInto(fData, fd, 2)




