library(catdap)


### Name: catdap2
### Title: Categorical Data Analysis Program Package 02
### Aliases: catdap2
### Keywords: category

### ** Examples

# Example 1 (medical data "HealthData")
# as additional output, contingency tables for explanatory variable sets
# c("aortic.wav","min.press") and c("ecg","age") are obtained.

data(HealthData)
catdap2(HealthData, c(2, 2, 2, 0, 0, 0, 0, 2), "symptoms",
        c(0., 0., 0., 1., 1., 1., 0.1, 0.), ,
        list(c("aortic.wav", "min.press"), c("ecg", "age")))

# Example 2 (Edgar Anderson's Iris Data)
# continuous response variable handling and the usage of Barplot2WayTable
# function to visualize the the result in shape of stacked histogram.

data(iris)  
resvar <- "Petal.Width"
z <- catdap2(iris, c(0, 0, 0, -7, 2), resvar, c(0.1, 0.1, 0.1, 0.1, 0))
z

vname <- names(iris)
exvar <- c("Sepal.Length", "Petal.Length")
Barplot2WayTable(vname, resvar, exvar, z$tway.table, z$interval)

# Example 3  (in the case of a large number of variables)
data(HelloGoodbye)
pool <- rep(2, 56)

## using the default values of parameters pa1, pa2, pa3
## catdap2(HelloGoodbye, pool, "Isay", nvar = 10, print.level = 1, plot = 0) 
## error : Working area for contingency table is too short, try pa1 = 12.

### According to the error message, set the parameter p1 at 12, then ..
catdap2(HelloGoodbye, pool, "Isay", nvar = 10, pa1 = 12, print.level = 1,
        plot = 0)

# Example 4 (HealthData with missing values)
data(MissingHealthData)
catdap2(MissingHealthData, c(2, 2, 2, 0, 0, 0, 0, 2), "symptoms",
        c(0., 0., 0., 1., 1., 1., 0.1, 0.), missingmark = 300)



