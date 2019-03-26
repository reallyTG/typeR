library(ggformula)


### Name: gf_line
### Title: Formula interface to geom_line() and geom_path()
### Aliases: gf_line gf_path

### ** Examples

gf_line()
if (require(mosaicData)) {
  gf_point(age ~ sex, alpha = 0.25, data = HELPrct)
  gf_point(births ~ date, color = ~ wday, data = Births78)
  # lines make the exceptions stand out more prominently
  gf_line(births ~ date, color = ~ wday, data = Births78)
  }

gf_path()
if (require(dplyr)) {
  data.frame(t = seq(1, 10 * pi, length.out = 400)) %>%
  mutate( x = t * cos(t), y = t * sin(t)) %>%
  gf_path(y ~ x, color = ~ t)
  }



