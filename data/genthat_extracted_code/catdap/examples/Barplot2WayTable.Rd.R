library(catdap)


### Name: Barplot2WayTable
### Title: Bar Plots for Two-Way Tables
### Aliases: Barplot2WayTable
### Keywords: ts

### ** Examples

# catdap1c (Titanic data)
resvar <- "Survived"
z1 <- catdap1c(Titanic, resvar)

vname <- names(dimnames(Titanic))
Barplot2WayTable(vname, resvar, , z1$tway.table)

# catdap2 (Edgar Anderson's Iris Data)
# "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width" "Species" 
data(iris)
resvar <- "Petal.Width"
vname <- names(iris)
z2 <- catdap2(iris, c(0, 0, 0, -7, 2), resvar, c(0.1, 0.1, 0.1, 0.1, 0))

exvar <- c("Sepal.Length", "Petal.Length")
Barplot2WayTable(vname, resvar, exvar, z2$tway.table, z2$interval)



