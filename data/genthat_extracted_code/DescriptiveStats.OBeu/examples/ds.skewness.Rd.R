library(DescriptiveStats.OBeu)


### Name: ds.skewness
### Title: Calculation of Skewness
### Aliases: ds.skewness

### ** Examples

# with a matrix as an input
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
        `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
ds.skewness(Matrix, tojson=FALSE)

# with a data frame as an input
ds.skewness(iris, tojson=FALSE)

# with a vector as an input and json output
vec <- as.vector(iris$Sepal.Width)
ds.skewness(vec, tojson=TRUE)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.skewness(Wuppertal_df[,-4], tojson = FALSE)




