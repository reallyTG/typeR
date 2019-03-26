library(VGAM)


### Name: rec.normal
### Title: Upper Record Values from a Univariate Normal Distribution
### Aliases: rec.normal
### Keywords: models regression

### ** Examples

nn <- 10000; mymean <- 100
# First value is reference value or trivial record
Rdata <- data.frame(rawy = c(mymean, rnorm(nn, me = mymean, sd = exp(3))))
# Keep only observations that are records:
rdata <- data.frame(y = unique(cummax(with(Rdata, rawy))))

fit <- vglm(y ~ 1, rec.normal, data = rdata, trace = TRUE, maxit = 200)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



