library(pmml)


### Name: pmml.lm
### Title: Generate PMML for lm objects
### Aliases: pmml.lm

### ** Examples

fit <- lm(Sepal.Length ~ ., data=iris)
pmml(fit)

rm(fit)




