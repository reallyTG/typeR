library(magrittr)


### Name: %$%
### Title: magrittr exposition pipe-operator
### Aliases: %$%

### ** Examples

iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)

data.frame(z = rnorm(100)) %$%
  ts.plot(z)



