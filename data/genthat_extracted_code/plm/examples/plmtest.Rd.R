library(plm)


### Name: plmtest
### Title: Lagrange Multiplier Tests for Panel Models
### Aliases: plmtest plmtest.plm plmtest.formula
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
g <- plm(inv ~ value + capital, data = Grunfeld, model = "pooling")
plmtest(g)
plmtest(g, effect="time")
plmtest(inv ~ value + capital, data = Grunfeld, type = "honda")
plmtest(inv ~ value + capital, data = Grunfeld, type = "bp")
plmtest(inv ~ value + capital, data = Grunfeld, type = "bp",  effect = "twoways")
plmtest(inv ~ value + capital, data = Grunfeld, type = "ghm", effect = "twoways")
plmtest(inv ~ value + capital, data = Grunfeld, type = "kw",  effect = "twoways")

Grunfeld_unbal <- Grunfeld[1:(nrow(Grunfeld)-1), ] # create an unbalanced panel data set
g_unbal <- plm(inv ~ value + capital, data = Grunfeld_unbal, model = "pooling")
plmtest(g_unbal) # unbalanced version of test is indicated in output



