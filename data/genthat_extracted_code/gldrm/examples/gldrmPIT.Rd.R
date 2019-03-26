library(gldrm)


### Name: gldrmPIT
### Title: Confidence intervals for gldrm coefficients
### Aliases: gldrmPIT

### ** Examples

data(iris, package="datasets")

### Fit gldrm and return fTiltMatrix
fit <- gldrm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
             data=iris, link="log")
             
# Probability inverse transform plot
gldrmPIT(fit)




