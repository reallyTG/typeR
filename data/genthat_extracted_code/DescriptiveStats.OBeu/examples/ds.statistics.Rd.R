library(DescriptiveStats.OBeu)


### Name: ds.statistics
### Title: Calculation of the Statistic Measures
### Aliases: ds.statistics

### ** Examples

# with matrix as an input and json outpout
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
        `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
ds.statistics(Matrix, tojson=TRUE)

# with vector as an input
vec <- as.vector(iris$Sepal.Width)
ds.statistics(vec, tojson=FALSE)

# with data frame as an input
ds.statistics(iris, tojson=FALSE)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.statistics(Wuppertal_df$Amount, tojson = TRUE)




