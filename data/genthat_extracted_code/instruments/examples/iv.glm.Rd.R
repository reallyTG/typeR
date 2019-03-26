library(instruments)


### Name: iv.glm
### Title: Estimate generalized linear models with an instrumental
###   variable.
### Aliases: iv.glm
### Keywords: instrument

### ** Examples

# Fake data
N <- 1000
z <- rnorm(N, 1, 1)
error <- rnorm(N, 1, 1)
x <- z + error + rnorm(N, 1, 1)
y <- rbinom(N, 1, invlogit(x + error))

# Fit glm
fit_glm <- glm( y ~ x, family = binomial(link = 'logit'))

# Fit with iv
fit_iv <- iv.glm(y ~ x, x ~ z, family = binomial, link = 'logit')

summary(fit_glm)
summary(fit_iv)



