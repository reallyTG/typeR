library(VGAM)


### Name: zoabetaR
### Title: Zero- and One-Inflated Beta Distribution Family Function
### Aliases: zoabetaR
### Keywords: regression

### ** Examples

nn <- 1000; set.seed(1)
bdata <- data.frame(x2 = runif(nn))
bdata <- transform(bdata,
  pobs0 = logit(-2 + x2, inverse = TRUE),
  pobs1 = logit(-2 + x2, inverse = TRUE))
bdata <- transform(bdata,
  y1 = rzoabeta(nn, shape1 = exp(1 + x2), shape2 = exp(2 - x2),
                pobs0 = pobs0, pobs1 = pobs1))
summary(bdata)
fit1 <- vglm(y1 ~ x2, zoabetaR(parallel.pobs = TRUE),
             data = bdata, trace = TRUE)
coef(fit1, matrix = TRUE)
summary(fit1)



