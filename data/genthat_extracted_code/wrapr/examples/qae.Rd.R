library(wrapr)


### Name: qae
### Title: Quote assignment expressions (name = expr, name := expr, name
###   %:=% expr).
### Aliases: qae

### ** Examples


ratio <- 2

exprs <- qae(Sepal_Long := Sepal.Length >= ratio * Sepal.Width,
             Petal_Short = Petal.Length <= 3.5)
print(exprs)

exprs <- qae(Sepal_Long := Sepal.Length >= .(ratio) * Sepal.Width,
             Petal_Short = Petal.Length <= 3.5)
print(exprs)

# library("rqdatatable")
# datasets::iris %.>%
#  extend_se(., exprs) %.>%
#  summary(.)




