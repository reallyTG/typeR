library(plm)


### Name: pwaldtest
### Title: Wald-style Chi-square Test and F Test
### Aliases: pwaldtest pwaldtest.plm
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
mod_fe <- plm(inv ~ value + capital, data = Grunfeld, model = "within")
mod_re <- plm(inv ~ value + capital, data = Grunfeld, model = "random")
pwaldtest(mod_fe, test = "F")
pwaldtest(mod_re, test = "Chisq")

# with robust vcov (matrix, function)
pwaldtest(mod_fe, vcov = vcovHC(mod_fe))
pwaldtest(mod_fe, vcov = function(x) vcovHC(x, type = "HC3"))

pwaldtest(mod_fe, vcov = vcovHC(mod_fe), df2adj = FALSE) # w/o df2 adjustment

# example without attribute "cluster" in the vcov
vcov_mat <- vcovHC(mod_fe)
attr(vcov_mat, "cluster") <- NULL  # remove attribute
pwaldtest(mod_fe, vcov = vcov_mat) # no df2 adjustment performed




