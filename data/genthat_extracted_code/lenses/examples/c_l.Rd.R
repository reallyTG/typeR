library(lenses)


### Name: c_l
### Title: Convenient lens composition
### Aliases: c_l

### ** Examples

view(iris, c_l("Petal.Length", 10:20, 3))
sepal_l <- index("Sepal.Length")
view(iris, c_l(sepal_l, id_l, 3))



