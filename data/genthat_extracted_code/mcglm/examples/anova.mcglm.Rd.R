library(mcglm)


### Name: anova.mcglm
### Title: Anova Tables
### Aliases: anova.mcglm

### ** Examples

x1 <- seq(-1, 1, l = 100)
x2 <- gl(5, 20)
beta <- c(5, 0, -2, -1, 1, 2)
X <- model.matrix(~ x1 + x2)
set.seed(123)
y <- rnorm(100, mean = X%*%beta, sd = 1)
data = data.frame("y" = y, "x1" = x1, "x2" = x2)
fit.anova <- mcglm(c(y ~ x1 + x2), list(mc_id(data)), data = data)
anova(fit.anova)




