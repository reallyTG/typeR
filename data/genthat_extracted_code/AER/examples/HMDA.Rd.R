library(AER)


### Name: HMDA
### Title: Home Mortgage Disclosure Act Data
### Aliases: HMDA
### Keywords: datasets

### ** Examples

data("HMDA")

## Stock and Watson (2007)
## Equations 11.1, 11.3, 11.7, 11.8 and 11.10, pp. 387--395
fm1 <- lm(I(as.numeric(deny) - 1) ~ pirat, data = HMDA)
fm2 <- lm(I(as.numeric(deny) - 1) ~ pirat + afam, data = HMDA)
fm3 <- glm(deny ~ pirat, family = binomial(link = "probit"), data = HMDA)
fm4 <- glm(deny ~ pirat + afam, family = binomial(link = "probit"), data = HMDA)
fm5 <- glm(deny ~ pirat + afam, family = binomial(link = "logit"), data = HMDA)

## More examples can be found in:
## help("StockWatson2007")



