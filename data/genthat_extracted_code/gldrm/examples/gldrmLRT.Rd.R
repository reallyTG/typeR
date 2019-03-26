library(gldrm)


### Name: gldrmLRT
### Title: Likelihood ratio test for nested models
### Aliases: gldrmLRT

### ** Examples

data(iris, package="datasets")

### Fit gldrm with all variables
fit <- gldrm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
             data=iris, link="log")

### Fit gldrm without the categorical variable "Species"
fit0 <- gldrm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width,
              data=iris, link="log")

### Likelihood ratio test for the nested models
lrt <- gldrmLRT(fit, fit0)
lrt




