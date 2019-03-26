library(AER)


### Name: GSOEP9402
### Title: German Socio-Economic Panel 1994-2002
### Aliases: GSOEP9402
### Keywords: datasets

### ** Examples

## data
data("GSOEP9402", package = "AER")

## some convenience data transformations
gsoep <- GSOEP9402
gsoep$year2 <- factor(gsoep$year)

## visualization
plot(school ~ meducation, data = gsoep, breaks = c(7, 9, 10.5, 11.5, 12.5, 15, 18))


## Chapter 5, Table 5.1
library("nnet")
gsoep_mnl <- multinom(
  school ~ meducation + memployment + log(income) + log(size) + parity + year2,
  data = gsoep)
coeftest(gsoep_mnl)[c(1:6, 1:6 + 14),]
 
## alternatively
if(require("mlogit")) {
gsoep_mnl2 <- mlogit(
  school ~ 0 | meducation + memployment + log(income) + log(size) + parity + year2,
  data = gsoep, shape = "wide", reflevel = "Hauptschule")
coeftest(gsoep_mnl2)[1:12,]
}

## Table 5.2
library("effects")
gsoep_eff <- effect("meducation", gsoep_mnl,
  xlevels = list(meducation = sort(unique(gsoep$meducation))))
gsoep_eff$prob
plot(gsoep_eff, confint = FALSE)

## omit year
gsoep_mnl1 <- multinom(
  school ~ meducation + memployment + log(income) + log(size) + parity,
  data = gsoep)
lrtest(gsoep_mnl, gsoep_mnl1)


## Chapter 6
## Table 6.1
library("MASS")
gsoep_pop <- polr(
  school ~ meducation + I(memployment != "none") + log(income) + log(size) + parity + year2,
  data = gsoep, method = "probit", Hess = TRUE)
gsoep_pol <- polr(
  school ~ meducation + I(memployment != "none") + log(income) + log(size) + parity + year2,
  data = gsoep, Hess = TRUE)

## compare polr and multinom via AIC
gsoep_pol1 <- polr(
  school ~ meducation + memployment + log(income) + log(size) + parity,
  data = gsoep, Hess = TRUE)
AIC(gsoep_pol1, gsoep_mnl)

## effects
eff_pol1 <- allEffects(gsoep_pol1)
plot(eff_pol1, ask = FALSE, confint = FALSE)


## More examples can be found in:
## help("WinkelmannBoes2009")



