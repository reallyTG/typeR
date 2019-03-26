library(mice)


### Name: ic
### Title: Select incomplete cases
### Aliases: ic
### Keywords: univar

### ** Examples


ic(nhanes)   # get the 12 rows with incomplete cases 
ic(nhanes[1:10,])  # incomplete cases within the first ten rows
ic(nhanes[, c("bmi", "hyp")])  # restrict extraction to variables bmi and hyp




