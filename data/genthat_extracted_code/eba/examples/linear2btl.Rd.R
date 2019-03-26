library(eba)


### Name: linear2btl
### Title: Linear Coefficients to Bradley-Terry-Luce (BTL) Estimates
### Aliases: linear2btl
### Keywords: models

### ** Examples

data(drugrisk)
y1 <- t(drugrisk[, , 1])[lower.tri(drugrisk[, , 1])]
y0 <-   drugrisk[, , 1][ lower.tri(drugrisk[, , 1])]

## Fit BTL model using glm (maximum likelihood)
btl.glm <- glm(cbind(y1, y0) ~ 0 + pcX(6), binomial)
linear2btl(btl.glm)

## Fit BTL model using lm (weighted least squares)
btl.lm <- lm(log(y1/y0) ~ 0 + pcX(6), weights=y1*y0/(y1 + y0))
linear2btl(btl.lm)



