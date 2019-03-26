library(DescriptiveStats.OBeu)


### Name: nums
### Title: Select the numeric columns of a given dataset
### Aliases: nums

### ** Examples

# with data frame as input
nums(iris)

# with vector as input
vec <- as.vector(iris$Sepal.Width)
nums(vec)

# with matrix as input
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
        `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
nums(Matrix)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
nums(Wuppertal_df[,-4])




