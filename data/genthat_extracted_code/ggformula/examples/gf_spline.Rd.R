library(ggformula)


### Name: gf_spline
### Title: Formula interface to geom_spline()
### Aliases: gf_spline

### ** Examples

if (require(mosaicData)) {
  gf_spline(births ~ date, color = ~ wday, data = Births78)
  gf_spline(births ~ date, color = ~ wday, data = Births78, df = 20)
  gf_spline(births ~ date, color = ~ wday, data = Births78, df = 4)
}



