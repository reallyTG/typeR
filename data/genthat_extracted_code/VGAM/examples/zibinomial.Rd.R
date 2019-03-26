library(VGAM)


### Name: zibinomial
### Title: Zero-Inflated Binomial Distribution Family Function
### Aliases: zibinomial zibinomialff
### Keywords: models regression

### ** Examples

size <- 10  # Number of trials; N in the notation above
nn <- 200
zdata <- data.frame(pstr0 = logit( 0, inverse = TRUE),  # 0.50
                    mubin = logit(-1, inverse = TRUE),  # Mean of usual binomial
                    sv    = rep(size, length = nn))
zdata <- transform(zdata,
                   y = rzibinom(nn, size = sv, prob = mubin, pstr0 = pstr0))
with(zdata, table(y))
fit <- vglm(cbind(y, sv - y) ~ 1, zibinomialff, data = zdata, trace = TRUE)
fit <- vglm(cbind(y, sv - y) ~ 1, zibinomialff, data = zdata, trace = TRUE,
            stepsize = 0.5)

coef(fit, matrix = TRUE)
Coef(fit)  # Useful for intercept-only models
head(fitted(fit, type = "pobs0"))  # Estimate of P(Y = 0)
head(fitted(fit))
with(zdata, mean(y))  # Compare this with fitted(fit)
summary(fit)



