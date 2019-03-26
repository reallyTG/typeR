library(plm)


### Name: pbgtest
### Title: Breusch-Godfrey Test for Panel Models
### Aliases: pbgtest pbgtest.panelmodel pbgtest.formula
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
g <- plm(inv ~ value + capital, data = Grunfeld, model = "random")

# panelmodel interface
pbgtest(g)
pbgtest(g, order = 4)

# formula interface
pbgtest(inv ~ value + capital, data = Grunfeld, model = "random")

# F test statistic (instead of default type="Chisq")
pbgtest(g, type="F")
pbgtest(inv ~ value + capital, data = Grunfeld, model = "random", type = "F")



