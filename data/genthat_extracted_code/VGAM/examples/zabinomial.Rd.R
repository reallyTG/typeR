library(VGAM)


### Name: zabinomial
### Title: Zero-Altered Binomial Distribution
### Aliases: zabinomial zabinomialff
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = runif(nn <- 1000))
zdata <- transform(zdata, size  = 10,
                          prob  = logit(-2 + 3*x2, inverse = TRUE),
                          pobs0 = logit(-1 + 2*x2, inverse = TRUE))
zdata <- transform(zdata,
                   y1 = rzabinom(nn, size = size, prob = prob, pobs0 = pobs0))
with(zdata, table(y1))

zfit <- vglm(cbind(y1, size - y1) ~ x2, zabinomial(zero = NULL),
             data = zdata, trace = TRUE)
coef(zfit, matrix = TRUE)
head(fitted(zfit))
head(predict(zfit))
summary(zfit)



