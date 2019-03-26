library(wrapr)


### Name: qe
### Title: Quote expressions.
### Aliases: qe

### ** Examples


ratio <- 2

exprs <- qe(Sepal.Length >= ratio * Sepal.Width,
             Petal.Length <= 3.5)
print(exprs)

exprs <- qe(Sepal.Length >= .(ratio) * Sepal.Width,
             Petal.Length <= 3.5)
print(exprs)




