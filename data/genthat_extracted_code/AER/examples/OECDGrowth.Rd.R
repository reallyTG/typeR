library(AER)


### Name: OECDGrowth
### Title: OECD Macroeconomic Data
### Aliases: OECDGrowth
### Keywords: datasets

### ** Examples

data("OECDGrowth")

## Nonneman and Vanhoudt (1996), Table II
cor(OECDGrowth[, 3:6])
cor(log(OECDGrowth[, 3:6]))

## textbook Solow model
## Nonneman and Vanhoudt (1996), Table IV, and
## Zaman, Rousseeuw and Orhan (2001), Table 2
so_ols <- lm(log(gdp85/gdp60) ~ log(gdp60) + log(invest) + log(popgrowth+.05),
  data = OECDGrowth)
summary(so_ols)

## augmented and extended Solow growth model
## Nonneman and Vanhoudt (1996), Table IV
aso_ols <- lm(log(gdp85/gdp60) ~ log(gdp60) + log(invest) +
  log(school) + log(popgrowth+.05), data = OECDGrowth)
eso_ols <- lm(log(gdp85/gdp60) ~ log(gdp60) + log(invest) +
  log(school) + log(randd) + log(popgrowth+.05), data = OECDGrowth)

## determine unusual observations using LTS
library("MASS")
so_lts <- lqs(log(gdp85/gdp60) ~ log(gdp60) +  log(invest) + log(popgrowth+.05),
  data = OECDGrowth, psamp = 13, nsamp = "exact")

## large residuals
nok1 <- abs(residuals(so_lts))/so_lts$scale[2] > 2.5
residuals(so_lts)[nok1]/so_lts$scale[2]

## high leverage
X <- model.matrix(so_ols)[,-1]
cv <- cov.rob(X, nsamp = "exact")
mh <- sqrt(mahalanobis(X, cv$center, cv$cov))
nok2 <- mh > 2.5
mh[nok2]

## bad leverage
nok <- which(nok1 & nok2)
nok

## robust results without bad leverage points
so_rob <- update(so_ols, subset = -nok)
summary(so_rob)
## This is similar to Zaman, Rousseeuw and Orhan (2001), Table 2
## but uses exact computations (and not sub-optimal results
## for the robust functions lqs and cov.rob)



