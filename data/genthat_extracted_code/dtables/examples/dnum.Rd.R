library(dtables)


### Name: dnum
### Title: Create standard descriptive statistics
### Aliases: dnum

### ** Examples


# Single variable
dnum(iris2$Sepal.Length)
dnum(iris2["Sepal.Length"])
dnum(iris2[, "Sepal.Length"])

# Multiple variables
dnum(iris2[, c("Sepal.Length", "Sepal.Width")])

# Will not save you from yourself (will create numeric data for factors):
dnum(iris2$Species)




