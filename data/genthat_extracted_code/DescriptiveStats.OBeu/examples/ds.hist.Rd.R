library(DescriptiveStats.OBeu)


### Name: ds.hist
### Title: Histogram breaks and frequencies
### Aliases: ds.hist

### ** Examples

# with a vector as an input and the defaults parameters
vec <- as.vector(iris$Sepal.Width)
ds.hist(vec)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.hist(Wuppertal_df$Amount, tojson = TRUE)




