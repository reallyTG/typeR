library(AER)


### Name: GrowthDJ
### Title: Determinants of Economic Growth
### Aliases: GrowthDJ
### Keywords: datasets

### ** Examples

## data for non-oil-producing countries
data("GrowthDJ")
dj <- subset(GrowthDJ, oil == "no")
## Different scalings have been used by different authors,
## different types of standard errors, etc.,
## see Koenker & Zeileis (2009) for an overview

## Durlauf & Johnson (1995), Table II
mrw_model <- I(log(gdp85) - log(gdp60)) ~ log(gdp60) +
  log(invest/100) + log(popgrowth/100 + 0.05) + log(school/100)
dj_mrw <- lm(mrw_model, data = dj)
coeftest(dj_mrw) 

dj_model <- I(log(gdp85) - log(gdp60)) ~ log(gdp60) +
  log(invest) + log(popgrowth/100 + 0.05) + log(school)
dj_sub1 <- lm(dj_model, data = dj, subset = gdp60 < 1800 & literacy60 < 50)
coeftest(dj_sub1, vcov = sandwich)

dj_sub2 <- lm(dj_model, data = dj, subset = gdp60 >= 1800 & literacy60 >= 50)
coeftest(dj_sub2, vcov = sandwich)



