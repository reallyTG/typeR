library(mltools)


### Name: bin_data
### Title: Map a vector of numeric values into bins
### Aliases: bin_data

### ** Examples

library(data.table)
iris.dt <- data.table(iris)

# custom bins
bin_data(iris.dt, binCol="Sepal.Length", bins=c(4, 5, 6, 7, 8))

# 10 equally spaced bins
bin_data(iris$Petal.Length, bins=10, returnDT=TRUE)

# make the last bin [left-closed, right-open)
bin_data(c(0,0,1,2), bins=2, boundaryType="lcro)", returnDT=TRUE)

# bin values by quantile
bin_data(c(0,0,0,0,1,2,3,4), bins=4, binType="quantile", returnDT=TRUE)




