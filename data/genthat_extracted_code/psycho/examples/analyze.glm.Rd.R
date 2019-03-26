library(psycho)


### Name: analyze.glm
### Title: Analyze glm objects.
### Aliases: analyze.glm

### ** Examples

library(psycho)
fit <- glm(Sex ~ Adjusting, data = psycho::affective, family = "binomial")

results <- analyze(fit)
summary(results)
print(results)



