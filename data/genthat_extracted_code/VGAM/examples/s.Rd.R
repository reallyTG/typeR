library(VGAM)


### Name: s
### Title: Defining Smooths in VGAM Formulas
### Aliases: s
### Keywords: models regression smooth

### ** Examples

# Nonparametric logistic regression
fit1 <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = hunua)
## Not run:  plot(fit1, se = TRUE) 

# Bivariate logistic model with artificial data
nn <- 300
bdata <- data.frame(x1 = runif(nn), x2 = runif(nn))
bdata <- transform(bdata,
    y1 = rbinom(nn, size = 1, prob = logit(sin(2 * x2), inverse = TRUE)),
    y2 = rbinom(nn, size = 1, prob = logit(sin(2 * x2), inverse = TRUE)))
fit2 <- vgam(cbind(y1, y2) ~ x1 + s(x2, 3), trace = TRUE,
             binom2.or(exchangeable = TRUE), data = bdata)
coef(fit2, matrix = TRUE)  # Hard to interpret
## Not run:  plot(fit2, se = TRUE, which.term = 2, scol = "blue") 



