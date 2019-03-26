library(rsample)


### Name: bootstraps
### Title: Bootstrap Sampling
### Aliases: bootstraps

### ** Examples

bootstraps(mtcars, times = 2)
bootstraps(mtcars, times = 2, apparent = TRUE)

library(purrr)
iris2 <- iris[1:130, ]

set.seed(13)
resample1 <- bootstraps(iris2, times = 3)
map_dbl(resample1$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })

set.seed(13)
resample2 <- bootstraps(iris2, strata = "Species", times = 3)
map_dbl(resample2$splits,
        function(x) {
          dat <- as.data.frame(x)$Species
          mean(dat == "virginica")
        })



