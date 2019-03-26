library(psycho)


### Name: analyze.fa
### Title: Analyze fa objects.
### Aliases: analyze.fa

### ** Examples

library(psycho)
library(psych)

x <- psych::fa(psych::Thurstone.33, 2)

results <- analyze(x)
print(results)
summary(results)
plot(results)



