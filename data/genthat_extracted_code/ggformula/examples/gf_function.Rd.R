library(ggformula)


### Name: gf_function
### Title: Layers displaying graphs of functions
### Aliases: gf_function gf_fun

### ** Examples

gf_function(fun = sqrt, xlim = c(0, 10))
if (require(mosaicData)) {
  gf_dhistogram( ~ age, data = HELPrct, binwidth = 3, alpha = 0.6) %>%
    gf_function(fun = stats::dnorm,
      args = list(mean = mean(HELPrct$age), sd = sd(HELPrct$age)),
      color = "red")
}
gf_fun(5 + 3 * cos(10 * x) ~ x, xlim = c(0,2))
# Utility bill is quadratic in month?
f <- makeFun(lm(totalbill ~ poly(month, 2), data = Utilities))
gf_point(totalbill ~ month, data = Utilities, alpha = 0.6) %>%
  gf_fun(f(m) ~ m, color = "red")



