library(clickR)


### Name: report
### Title: Generic function for reporting of models
### Aliases: report

### ** Examples

report(iris)  #Report of descriptive statistics
lm1 <- lm(Petal.Length ~ Sepal.Width + Species, data=iris)
report(lm1)   #Report of model



