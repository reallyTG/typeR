library(VGAM)


### Name: truncweibull
### Title: Truncated Weibull Distribution Family Function
### Aliases: truncweibull
### Keywords: models regression

### ** Examples

nn <- 5000; prop.lost <- 0.40   # Proportion lost to truncation
wdata <- data.frame(x2 = runif(nn))  # Complete Weibull data
wdata <- transform(wdata,
                   Betaa = exp(1))  # > 2 is okay (satisfies regularity conds)
wdata <- transform(wdata, Alpha = exp(0.5 - 1 * x2))
wdata <- transform(wdata, Shape = Betaa,
#                         aaa   = Betaa,
#                         bbb   = 1 / Alpha^(1 / Betaa),
                          Scale = 1 / Alpha^(1 / Betaa))
wdata <- transform(wdata, y2 = rweibull(nn, shape = Shape, scale = Scale))
summary(wdata)

lower.limit2 <- with(wdata, quantile(y2, prob = prop.lost))  # Proportion lost
wdata <- subset(wdata, y2 > lower.limit2)  # Smaller due to truncation

fit1 <- vglm(y2 ~ x2, maxit = 100, trace = TRUE,
             truncweibull(lower.limit = lower.limit2), data = wdata)
coef(fit1, matrix = TRUE)
summary(fit1)
vcov(fit1)
head(fit1@extra$lower.limit)



