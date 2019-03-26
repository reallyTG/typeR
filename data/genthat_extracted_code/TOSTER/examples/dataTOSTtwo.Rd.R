library(TOSTER)


### Name: dataTOSTtwo
### Title: TOST Independent Samples T-Test
### Aliases: dataTOSTtwo

### ** Examples

library(TOSTER)

## Load iris dataset, remove one of the three groups so two are left

data<-iris[which(iris$Species!="versicolor"),]

## TOST procedure on the raw data

dataTOSTtwo(data, deps="Sepal.Width", group="Species", var_equal = TRUE, low_eqbound = -0.5,
            high_eqbound = 0.5, alpha = 0.05, desc = TRUE, plots = TRUE)




