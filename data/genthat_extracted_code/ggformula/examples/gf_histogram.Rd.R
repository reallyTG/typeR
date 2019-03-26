library(ggformula)


### Name: gf_histogram
### Title: Formula interface to geom_histogram()
### Aliases: gf_histogram gf_dhistogram gf_histogramh gf_dhistogramh

### ** Examples

x <- rnorm(1000)
gf_histogram(  ~ x, bins = 30)
gf_dhistogram( ~ x, bins = 30)
gf_dhistogram( ~ x, binwidth = 0.5, center = 0, color = "black")
gf_dhistogram( ~ x, binwidth = 0.5, boundary = 0, color = "black")
gf_dhistogram( ~ x, bins = 30) %>%
 gf_fitdistr(dist = "dnorm")  # see help for gf_fitdistr() for more info.

gf_histogram( ~ x, fill = ~ (abs(x) <= 2), boundary = 2, binwidth = 0.25)

gf_histogram( ~ Sepal.Length | Species, data = iris, binwidth = 0.25)
if (require(mosaicData)) {
  gf_histogram( ~ age, data = HELPrct, binwidth = 5, fill = "skyblue", color = "black")
  # bins can be adjusted left/right using center or boundary
  gf_histogram( ~ age, data = HELPrct,
               binwidth = 5, fill = "skyblue", color = "black", center = 42.5)
  gf_histogram( ~ age, data = HELPrct,
                binwidth = 5, fill = "skyblue", color = "black", boundary = 40)
}

gf_histogramh( ~ x, bins = 30)
gf_histogramh( x ~ ., bins = 30)
gf_histogramh( x ~ stat(density), bins = 30)
gf_dhistogramh(~ x, bins = 30)
gf_dhistogramh(x ~ ., bins = 30)
# better to use gf_histogramh() here, but this works
gf_dhistogramh(x ~ stat(count), bins = 30)



