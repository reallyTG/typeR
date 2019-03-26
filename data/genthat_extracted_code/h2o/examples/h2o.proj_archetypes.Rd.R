library(h2o)


### Name: h2o.proj_archetypes
### Title: Convert Archetypes to Features from H2O GLRM Model
### Aliases: h2o.proj_archetypes

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
iris_glrm <- h2o.glrm(training_frame = iris_hf, k = 4, loss = "Quadratic",
                      multi_loss = "Categorical", max_iterations = 1000)
iris_parch <- h2o.proj_archetypes(iris_glrm, iris_hf)
head(iris_parch)
## End(No test)



