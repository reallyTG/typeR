library(DescriptiveStats.OBeu)


### Name: ds.box
### Title: Boxplot Parameters of a numeric vector
### Aliases: ds.box

### ** Examples

# with vector as an input and the default parameters
vec <- as.vector(iris$Sepal.Width)
ds.box(vec)

# with vector as an input and the different parameters
vec <- as.vector(iris$Sepal.Width)
ds.box(vec, c = 3, c.width = 0.20 , out = FALSE, tojson = FALSE)

# OpenBudgets.eu Dataset Example:
amounts <- as.vector(Wuppertal_df$Amount)
ds.box(amounts, c = 1.5, c.width = 0.20, out = TRUE)




