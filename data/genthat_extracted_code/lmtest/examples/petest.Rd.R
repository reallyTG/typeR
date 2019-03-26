library(lmtest)


### Name: petest
### Title: PE Test for Linear vs. Log-Linear Specifications
### Aliases: petest
### Keywords: htest

### ** Examples

if(require("AER")) {
## Verbeek (2004), Section 3
data("HousePrices", package = "AER")

### Verbeek (2004), Table 3.3
hp_lin <- lm(price ~ . , data = HousePrices)
summary(hp_lin)

### Verbeek (2004), Table 3.2
hp_log <- update(hp_lin, log(price) ~ . - lotsize + log(lotsize))
summary(hp_log)

## PE test
petest(hp_lin, hp_log)


## Greene (2003), Example 9.8
data("USMacroG", package = "AER")

## Greene (2003), Table 9.2
usm_lin <- lm(m1 ~ tbill + gdp, data = USMacroG)
usm_log <- lm(log(m1) ~ log(tbill) + log(gdp), data = USMacroG)
petest(usm_lin, usm_log)
## matches results from Greene's errata
}



