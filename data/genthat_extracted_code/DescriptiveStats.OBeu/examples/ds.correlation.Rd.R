library(DescriptiveStats.OBeu)


### Name: ds.correlation
### Title: Correlation Coefficient of a dataframe
### Aliases: ds.correlation

### ** Examples

# with data frame as an input and the default parameters
data <- iris
ds.correlation(data, cor.method = "pearson", tojson=FALSE)

# with matrix as an input , different parameters and json output
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
         `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
ds.correlation(Matrix, cor.method = "kendall", tojson=TRUE)





