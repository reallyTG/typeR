library(intubate)


### Name: RRF
### Title: Interfaces for RRF package for data science pipelines.
### Aliases: ntbt_RRF ntbt_rrfImpute
### Keywords: intubate magrittr RRF rrfImpute

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(RRF)
##D 
##D 
##D data(iris)
##D set.seed(111)
##D ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.8, 0.2))
##D 
##D ## Original function to interface
##D RRF(Species ~ ., data=iris[ind == 1,])
##D 
##D ## The interface puts data as first parameter
##D ntbt_RRF(iris[ind == 1,], Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris[ind == 1,] %>%
##D   ntbt_RRF(Species ~ .)
##D 
##D 
##D ## ntbt_rrfImpute: Missing Value Imputations by RRF
##D data(iris)
##D iris.na <- iris
##D set.seed(111)
##D for (i in 1:4) iris.na[sample(150, sample(20)), i] <- NA
##D 
##D ## Original function to interface
##D set.seed(222)
##D rrfImpute(Species ~ ., iris.na)
##D 
##D ## The interface puts data as first parameter
##D set.seed(222)
##D ntbt_rrfImpute(iris.na, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(222)
##D iris.na %>%
##D   ntbt_rrfImpute(Species ~ .)
## End(Not run)



