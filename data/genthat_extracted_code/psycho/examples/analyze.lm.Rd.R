library(psycho)


### Name: analyze.lm
### Title: Analyze lm objects.
### Aliases: analyze.lm

### ** Examples

library(psycho)
fit <- lm(Sepal.Length ~ Sepal.Width, data = iris)
fit <- lm(Sepal.Length ~ Sepal.Width * Species, data = iris)

results <- analyze(fit)
summary(results)
print(results)



