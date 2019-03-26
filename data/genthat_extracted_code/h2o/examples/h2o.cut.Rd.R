library(h2o)


### Name: h2o.cut
### Title: Cut H2O Numeric Data to Factor
### Aliases: h2o.cut cut.H2OFrame

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)
summary(iris_hf)

# Cut sepal length column into intervals determined by min/max/quantiles
sepal_len_cut <- cut(iris_hf$Sepal.Length, c(4.2, 4.8, 5.8, 6, 8))
head(sepal_len_cut)
summary(sepal_len_cut)
## End(No test)



