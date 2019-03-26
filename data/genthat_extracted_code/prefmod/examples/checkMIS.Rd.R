library(prefmod)


### Name: checkMIS
### Title: Function to check/report missing values in paired comparison
###   studies
### Aliases: checkMIS
### Keywords: models multivariate

### ** Examples

# no missing NAs in dataset dat4
checkMIS(dat4, nitems = 4, verbose = TRUE)

# generates data set with three items and some missing values in
# comparison (23), column 3, then there are no NAs for object 1
data3 <- dat4[, 1:3]
idx3  <- sample(1:100, 10)
data3[idx3, 3] <- NA
checkMIS(data3, nitems = 3, verbose = TRUE)

# estimate MCAR PC pattern model for data3 with NA indicators alpha1
# cannot be estimated being accommodated by using checkMIS
pattPC.fit(data3, nitems = 3, MISalpha = checkMIS(data3, nitems = 3))



