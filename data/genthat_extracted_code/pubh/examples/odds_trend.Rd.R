library(pubh)


### Name: odds_trend
### Title: Function to calculate OR using Wald CI, and plot trend.
### Aliases: odds_trend

### ** Examples

## A cross-sectional study looked at the association between obesity and a biopsy resulting
## from mammography screening.

Freq <- c(3441, 34, 39137, 519, 20509, 280, 12149, 196, 11882, 199)
Biopsy <- gl(2, 1, 10, labels = c("No", "Yes"))
Weight <- gl(5, 2, 10, labels = c("Underweight", "Normal", "Over (11-24%)",
             "Over (25-39%)", "Over (> 39%)"))
breast <- data.frame(Freq, Biopsy, Weight)
breast

breast <- expand_df(breast)
odds_trend(Biopsy ~ Weight, data = breast)



