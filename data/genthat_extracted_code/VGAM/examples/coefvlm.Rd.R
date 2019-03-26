library(VGAM)


### Name: coefvlm
### Title: Extract Model Coefficients
### Aliases: coefvlm
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = runif(nn <- 200))
zdata <- transform(zdata, pstr0  = logit(-0.5 + 1*x2, inverse = TRUE),
                          lambda = loge(  0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y2 = rzipois(nn, lambda, pstr0 = pstr0))

fit2 <- vglm(y2 ~ x2, zipoisson(zero = 1), data = zdata, trace = TRUE)
coef(fit2, matrix = TRUE)  # Always a good idea
coef(fit2)
coef(fit2, colon = TRUE)



