library(AER)


### Name: Grunfeld
### Title: Grunfeld's Investment Data
### Aliases: Grunfeld
### Keywords: datasets

### ** Examples

data("Grunfeld", package = "AER")

## Greene (2003)
## subset of data with mistakes
ggr <- subset(Grunfeld, firm %in% c("General Motors", "US Steel",
  "General Electric", "Chrysler", "Westinghouse"))
ggr[c(26, 38), 1] <- c(261.6, 645.2)
ggr[32, 3] <- 232.6

## Tab. 14.2, col. "GM"
fm_gm <- lm(invest ~ value + capital, data = ggr, subset = firm == "General Motors")
mean(residuals(fm_gm)^2)   ## Greene uses MLE

## Tab. 14.2, col. "Pooled"
fm_pool <- lm(invest ~ value + capital, data = ggr)

## equivalently
library("plm")
pggr <- pdata.frame(ggr, c("firm", "year"))
library("systemfit")
fm_ols <- systemfit(invest ~ value + capital, data = pggr, method = "OLS")
fm_pols <- systemfit(invest ~ value + capital, data = pggr, method = "OLS",
  pooled = TRUE)

## Tab. 14.1
fm_sur <- systemfit(invest ~ value + capital, data = pggr, method = "SUR",
  methodResidCov = "noDfCor")
fm_psur <- systemfit(invest ~ value + capital, data = pggr, method = "SUR", pooled = TRUE,
  methodResidCov = "noDfCor", residCovWeighted = TRUE)

## Further examples:
## help("Greene2003")



## Panel models
library("plm")
pg <- pdata.frame(subset(Grunfeld, firm != "American Steel"), c("firm", "year"))

fm_fe <- plm(invest ~ value + capital, model = "within", data = pg)
summary(fm_fe)
coeftest(fm_fe, vcov = vcovHC)

fm_reswar <- plm(invest ~ value + capital, data = pg,
  model = "random", random.method = "swar")
summary(fm_reswar)

## testing for random effects
fm_ols <- plm(invest ~ value + capital, data = pg, model = "pooling")
plmtest(fm_ols, type = "bp")
plmtest(fm_ols, type = "honda")

## Random effects models
fm_ream <- plm(invest ~ value + capital, data = pg, model = "random",
  random.method = "amemiya")
fm_rewh <- plm(invest ~ value + capital, data = pg, model = "random",
  random.method = "walhus")
fm_rener <- plm(invest ~ value + capital, data = pg, model = "random",
  random.method = "nerlove")

## Baltagi (2005), Tab. 2.1
rbind(
  "OLS(pooled)" = coef(fm_ols),
  "FE" = c(NA, coef(fm_fe)),
  "RE-SwAr" = coef(fm_reswar),
  "RE-Amemiya" = coef(fm_ream),
  "RE-WalHus" = coef(fm_rewh),
  "RE-Nerlove" = coef(fm_rener))

## Hausman test
phtest(fm_fe, fm_reswar)

## Further examples:
## help("Baltagi2002")
## help("Greene2003")



