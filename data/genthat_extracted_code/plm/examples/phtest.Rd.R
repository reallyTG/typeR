library(plm)


### Name: phtest
### Title: Hausman Test for Panel Models
### Aliases: phtest phtest.formula phtest.panelmodel
### Keywords: htest

### ** Examples

data("Gasoline", package = "plm")
form <- lgaspcar ~ lincomep + lrpmg + lcarpcap
wi <- plm(form, data = Gasoline, model = "within")
re <- plm(form, data = Gasoline, model = "random")
phtest(wi, re)
phtest(form, data = Gasoline)
phtest(form, data = Gasoline, method = "aux")

# robust Hausman test (regression-based)
phtest(form, data = Gasoline, method = "aux", vcov = vcovHC)

# robust Hausman test with vcov supplied as a
# function and additional parameters
phtest(form, data = Gasoline, method = "aux",
  vcov = function(x) vcovHC(x, method="white2", type="HC3"))



