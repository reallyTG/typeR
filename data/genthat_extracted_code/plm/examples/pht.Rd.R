library(plm)


### Name: pht
### Title: Hausman-Taylor Estimator for Panel Data
### Aliases: pht summary.pht print.summary.pht
### Keywords: regression

### ** Examples

# replicates Baltagi (2005, 2013), table 7.4
data("Wages", package = "plm")
ht <- pht(lwage ~ wks + south + smsa + married + exp + I(exp^2) +
          bluecol + ind + union + sex + black + ed | 
          sex + black + bluecol + south + smsa + ind,
          data = Wages, model = "ht", index = 595)
summary(ht)



