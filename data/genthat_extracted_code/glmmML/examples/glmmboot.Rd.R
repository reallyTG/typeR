library(glmmML)


### Name: glmmboot
### Title: Generalized Linear Models with fixed effects grouping
### Aliases: glmmboot
### Keywords: regression nonlinear

### ** Examples

## Not run:
id <- factor(rep(1:20, rep(5, 20)))
y <- rbinom(100, prob = rep(runif(20), rep(5, 20)), size = 1)
x <- rnorm(100)
dat <- data.frame(y = y, x = x, id = id)
res <- glmmboot(y ~ x, cluster = id, data = dat, boot = 5000)
## End(Not run)
##system.time(res.glm <- glm(y ~ x + id, family = binomial))



