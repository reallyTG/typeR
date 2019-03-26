library(plm)


### Name: pbltest
### Title: Baltagi and Li Serial Dependence Test For Random Effects Models
### Aliases: pbltest pbltest.formula pbltest.plm
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")

# formula interface
pbltest(inv ~ value + capital, data = Grunfeld)

# plm interface
re_mod <- plm(inv ~ value + capital, data = Grunfeld, model = "random")
pbltest(re_mod)
pbltest(re_mod, alternative = "onesided")



