library(DescTools)


### Name: HosmerLemeshowTest
### Title: Hosmer-Lemeshow Goodness of Fit Tests
### Aliases: HosmerLemeshowTest
### Keywords: univar

### ** Examples

set.seed(111)

x1 <- factor(sample(1:3, 50, replace = TRUE))
x2 <- rnorm(50)
obs <- sample(c(0,1), 50, replace = TRUE)

fit <- glm(obs ~ x1+x2, family = binomial)

HosmerLemeshowTest(fit = fitted(fit), obs = obs, X = cbind(x1, x2))



