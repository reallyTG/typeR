library(DataCombine)


### Name: FindDups
### Title: Find duplicated values in a data frame and subset it to either
###   include or not include them.
### Aliases: FindDups

### ** Examples

Data <- data.frame(ID = c(1, 1, 2, 2), Value = c(1, 2, 3, 4))

FindDups(Data, Vars = 'ID')




