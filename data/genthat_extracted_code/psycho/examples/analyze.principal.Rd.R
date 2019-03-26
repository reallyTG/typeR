library(psycho)


### Name: analyze.principal
### Title: Analyze fa objects.
### Aliases: analyze.principal

### ** Examples

library(psycho)
library(psych)

x <- psych::pca(psych::Thurstone.33, 2)

results <- analyze(x)
print(results)
summary(results)
plot(results)



