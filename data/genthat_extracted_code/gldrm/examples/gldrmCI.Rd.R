library(gldrm)


### Name: gldrmCI
### Title: Confidence intervals for gldrm coefficients
### Aliases: gldrmCI

### ** Examples

data(iris, package="datasets")

### Fit gldrm with all variables
fit <- gldrm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
             data=iris, link="log")

### Wald 95% confidence interval for Sepal.Width
ci <- gldrmCI(fit, "Sepal.Width", test="Wald", level=.95, type="2-sided")
ci




