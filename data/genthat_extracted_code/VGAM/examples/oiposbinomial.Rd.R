library(VGAM)


### Name: oiposbinomial
### Title: One-Inflated Positive Binomial Distribution Family Function
### Aliases: oiposbinomial
### Keywords: models regression

### ** Examples

size <- 10  # Number of trials; N in the notation above
nn <- 200
odata <- data.frame(pstr1  = logit( 0, inverse = TRUE),  # 0.50
                    mubin1 = logit(-1, inverse = TRUE),  # Mean of usual binomial
                    svec   = rep(size, length = nn),
                    x2     = runif(nn))
odata <- transform(odata,
                   mubin2 = logit(-1 + x2, inverse = TRUE))
odata <- transform(odata,
                   y1 = roiposbinom(nn, svec, pr = mubin1, pstr1 = pstr1),
                   y2 = roiposbinom(nn, svec, pr = mubin2, pstr1 = pstr1))
with(odata, table(y1))
fit1 <- vglm(y1 / svec ~  1, oiposbinomial, data = odata,
             weights = svec, trace = TRUE, crit = "coef")
fit2 <- vglm(y2 / svec ~ x2, oiposbinomial, data = odata,
             weights = svec, trace = TRUE)

coef(fit1, matrix = TRUE)
Coef(fit1)  # Useful for intercept-only models
head(fitted(fit1, type = "pobs1"))  # Estimate of P(Y = 1)
head(fitted(fit1))
with(odata, mean(y1))  # Compare this with fitted(fit1)
summary(fit1)



