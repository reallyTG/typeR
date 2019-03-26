library(MKmisc)


### Name: HLgof.test
### Title: Hosmer-Lemeshow goodness of fit tests.
### Aliases: HLgof.test
### Keywords: univar

### ** Examples

set.seed(111)
x1 <- factor(sample(1:3, 50, replace = TRUE))
x2 <- rnorm(50)
obs <- sample(c(0,1), 50, replace = TRUE)
fit <- glm(obs ~ x1+x2, family = binomial)
HLgof.test(fit = fitted(fit), obs = obs)
HLgof.test(fit = fitted(fit), obs = obs, X = model.matrix(obs ~ x1+x2))



