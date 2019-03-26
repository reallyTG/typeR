library(DescriptiveStats.OBeu)


### Name: ds.kurtosis
### Title: Calculation of Kurtosis
### Aliases: ds.kurtosis

### ** Examples

# with a matrix as an input
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
        `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
ds.kurtosis(Matrix, tojson=FALSE)

# with a data frame as an input
ds.kurtosis(iris, tojson=FALSE)

# with a vector as an input and json output
vec <- as.vector(iris$Sepal.Width)
ds.kurtosis(vec, tojson=TRUE)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.kurtosis(Wuppertal_df[,-4], tojson = FALSE)




