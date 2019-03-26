library(plm)


### Name: pdwtest
### Title: Durbin-Watson Test for Panel Models
### Aliases: pdwtest pdwtest.panelmodel pdwtest.formula
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
g <- plm(inv ~ value + capital, data = Grunfeld, model="random")
pdwtest(g)
pdwtest(g, alternative="two.sided")
## formula interface
pdwtest(inv ~ value + capital, data=Grunfeld, model="random")



