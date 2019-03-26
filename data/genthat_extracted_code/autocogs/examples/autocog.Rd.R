library(autocogs)


### Name: autocog
### Title: Auto cognostic function
### Aliases: autocog

### ** Examples

autocog("univariate_continuous", iris$Sepal.Length)
fn <- autocog("univariate_continuous", .fn_only = TRUE)
fn(iris$Sepal.Length)



