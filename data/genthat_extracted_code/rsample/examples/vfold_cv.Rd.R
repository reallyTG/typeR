library(rsample)


### Name: vfold_cv
### Title: V-Fold Cross-Validation
### Aliases: vfold_cv

### ** Examples

vfold_cv(mtcars, v = 10)
vfold_cv(mtcars, v = 10, repeats = 2)

library(purrr)
iris2 <- iris[1:130, ]

set.seed(13)
folds1 <- vfold_cv(iris2, v = 5)
map_dbl(folds1$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })

set.seed(13)
folds2 <- vfold_cv(iris2, strata = "Species", v = 5)
map_dbl(folds2$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })



