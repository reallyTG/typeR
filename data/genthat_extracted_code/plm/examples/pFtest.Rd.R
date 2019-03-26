library(plm)


### Name: pFtest
### Title: F Test for Individual and/or Time Effects
### Aliases: pFtest pFtest.formula pFtest.plm
### Keywords: htest

### ** Examples

data("Grunfeld", package="plm")
gp <- plm(inv ~ value + capital, data = Grunfeld, model = "pooling")
gi <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "individual", model = "within")
gt <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "time", model = "within")
gd <- plm(inv ~ value + capital, data = Grunfeld,
          effect = "twoways", model = "within")
pFtest(gi, gp)
pFtest(gt, gp)
pFtest(gd, gp)
pFtest(inv ~ value + capital, data = Grunfeld, effect = "twoways")



