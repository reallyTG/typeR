library(mcemGLM)


### Name: mcemGLM-package
### Title: Generalized Linear Mixed Model Estimation via Monte Carlo EM
### Aliases: mcemGLM-package mcemGLM
### Keywords: glmm

### ** Examples

## No test: 
set.seed(123)
x <- rnorm(30, 10, 1)
z <- factor(rep(1:6, each = 5))
obs <- sample(0:1, 30, TRUE)
fit <- mcemGLMM(obs ~ x, random = ~ 0 + z, family = "bernoulli",
vcDist = "normal", controlEM = list(EMit = 15, MCit = 10000), 
initial = c(3.30, -0.35, 0.005))
summary(fit)
anova(fit)
## End(No test)



