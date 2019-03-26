library(AER)


### Name: Longley
### Title: Longley's Regression Data
### Aliases: Longley
### Keywords: datasets

### ** Examples

data("Longley")
library("dynlm")

## Example 4.6 in Greene (2003)
fm1 <- dynlm(employment ~ time(employment) + price + gnp + armedforces,
  data = Longley)
fm2 <- update(fm1, end = 1961)
cbind(coef(fm2), coef(fm1))

## Figure 4.3 in Greene (2003)
plot(rstandard(fm2), type = "b", ylim = c(-3, 3))
abline(h = c(-2, 2), lty = 2)



