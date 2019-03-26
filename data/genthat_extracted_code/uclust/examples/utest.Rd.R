library(uclust)


### Name: utest
### Title: U test
### Aliases: utest

### ** Examples


# Simulate a dataset with two separate groups, the first 5 rows have mean 0 and
# the last 5 rows have mean 5.
data <- matrix(c(rnorm(75, 0), rnorm(75, 5)), nrow = 10, byrow=TRUE)

# U test for mixed up groups
utest(group_id=c(1,0,1,0,1,0,1,0,1,0), data=data, numB=3000)
# U test for correct group definitions
utest(group_id=c(1,1,1,1,1,0,0,0,0,0), data=data, numB=3000)





