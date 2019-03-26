library(h2o)


### Name: h2o.reconstruct
### Title: Reconstruct Training Data via H2O GLRM Model
### Aliases: h2o.reconstruct

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
iris_glrm <- h2o.glrm(training_frame = iris_hf, k = 4, transform = "STANDARDIZE",
                      loss = "Quadratic", multi_loss = "Categorical", max_iterations = 1000)
iris_rec <- h2o.reconstruct(iris_glrm, iris_hf, reverse_transform = TRUE)
head(iris_rec)
## End(No test)



