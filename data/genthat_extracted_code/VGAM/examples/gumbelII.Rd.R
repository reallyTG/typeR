library(VGAM)


### Name: gumbelII
### Title: Gumbel-II Distribution Family Function
### Aliases: gumbelII
### Keywords: models regression

### ** Examples

gdata <- data.frame(x2 = runif(nn <- 1000))
gdata <- transform(gdata, heta1  = +1,
                          heta2  = -1 + 0.1 * x2,
                          ceta1 =  0,
                          ceta2 =  1)
gdata <- transform(gdata, shape1 = exp(heta1),
                          shape2 = exp(heta2),
                          scale1 = exp(ceta1),
                          scale2 = exp(ceta2))
gdata <- transform(gdata,
                   y1 = rgumbelII(nn, scale = scale1, shape = shape1),
                   y2 = rgumbelII(nn, scale = scale2, shape = shape2))

fit <- vglm(cbind(y1, y2) ~ x2,
            gumbelII(zero = c(1, 2, 3)), data = gdata, trace = TRUE)
coef(fit, matrix = TRUE)
vcov(fit)
summary(fit)



