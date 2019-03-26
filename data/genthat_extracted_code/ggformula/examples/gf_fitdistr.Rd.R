library(ggformula)


### Name: gf_fitdistr
### Title: Plot density function based on fit to data
### Aliases: gf_fitdistr

### ** Examples

if (require(mosaicData)) {
  gf_fitdistr( ~ length, data = KidsFeet, inherit = FALSE) %>%
    gf_dhistogram( ~ length, data = KidsFeet, binwidth = 0.5, alpha = 0.25)

  gf_dhistogram( ~ length, data = KidsFeet, binwidth = 0.5, alpha = 0.25) %>%
    gf_fitdistr()

  set.seed(12345)
  Dat <- data.frame(g = rgamma(500, 3, 10), f = rf(500, df1 = 3, df2 = 47))
  gf_dhistogram( ~ g, data = Dat) %>%
    gf_fitdistr(dist = "dgamma")

  gf_dhistogram( ~ g, data = Dat) %>%
    gf_fun(mosaicCore::fit_distr_fun( ~ g, data = Dat, dist = "dgamma"))

  gf_dhistogram( ~ f, data = Dat) %>%
    gf_fitdistr(dist = "df", start = list(df1 = 2, df2 = 50))

  # fitted parameters are default argument values
  args(
    mosaicCore::fit_distr_fun( ~ f, data = Dat, dist = "df",
      start = list(df1 = 2, df2 = 50)))
  args(mosaicCore::fit_distr_fun( ~ g, data = Dat, dist = "dgamma"))

}



