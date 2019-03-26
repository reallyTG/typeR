library(phylopath)


### Name: define_model_set
### Title: Define a model set.
### Aliases: define_model_set

### ** Examples

(m <- define_model_set(
  A = c(a~b, b~c),
  B = c(b~a, c~b),
  .common = c(d~a)))
plot_model_set(m)



