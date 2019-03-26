library(rsample)


### Name: mc_cv
### Title: Monte Carlo Cross-Validation
### Aliases: mc_cv

### ** Examples

mc_cv(mtcars, times = 2)
mc_cv(mtcars, prop = .5, times = 2)

library(purrr)
iris2 <- iris[1:130, ]

set.seed(13)
resample1 <- mc_cv(iris2, times = 3, prop = .5)
map_dbl(resample1$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })

set.seed(13)
resample2 <- mc_cv(iris2, strata = "Species", times = 3, prop = .5)
map_dbl(resample2$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })



