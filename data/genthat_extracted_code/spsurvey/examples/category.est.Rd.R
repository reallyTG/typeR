library(spsurvey)


### Name: category.est
### Title: Category Proportion and Size Estimates
### Aliases: category.est
### Keywords: survey univar

### ** Examples

catvar <- rep(c("north", "south", "east", "west"), rep(25, 4))
wgt <- runif(100, 10, 100)
category.est(catvar, wgt, vartype="SRS")

x <- runif(100)
y <- runif(100)
category.est(catvar, wgt, x, y)



