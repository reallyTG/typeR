library(DescriptiveStats.OBeu)


### Name: ds.boxplot
### Title: Boxplot Parameters of a matrix or data frame
### Aliases: ds.boxplot

### ** Examples

# with matrix as an input and the default parameters
Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
         `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
ds.boxplot(Matrix, out.level=1.5, width = 0.15 , outl = TRUE, tojson=FALSE)

# with data frame as an input, different parameters and json output
data <- iris
ds.boxplot(data, out.level=2, width = 0.25 , outl = FALSE, tojson=TRUE)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.boxplot(Wuppertal_df$Amount, out.level = 2.5, width = 0.15 , outl = TRUE, tojson = FALSE)
       



