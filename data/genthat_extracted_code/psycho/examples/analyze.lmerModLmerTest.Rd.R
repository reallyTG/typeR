library(psycho)


### Name: analyze.lmerModLmerTest
### Title: Analyze lmerModLmerTest objects.
### Aliases: analyze.lmerModLmerTest

### ** Examples

library(psycho)
library(lmerTest)
fit <- lmerTest::lmer(Sepal.Length ~ Sepal.Width + (1 | Species), data = iris)

results <- analyze(fit)
summary(results)
print(results)



