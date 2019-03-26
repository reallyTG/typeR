library(nullabor)


### Name: null_lm
### Title: Generate null data with null residuals from a model.
### Aliases: null_lm

### ** Examples

if (requireNamespace('reshape2', quietly = TRUE)) {
data("tips", package = "reshape2")
x <- lm(tip ~ total_bill, data = tips)
tips.reg <- data.frame(tips, .resid = residuals(x), .fitted = fitted(x))
library(ggplot2)
ggplot(lineup(null_lm(tip ~ total_bill, method = 'rotate'), tips.reg)) +
  geom_point(aes(x = total_bill, y = .resid)) +
  facet_wrap(~ .sample)
}



