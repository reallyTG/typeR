library(ggformula)


### Name: gf_smooth
### Title: Formula interface to geom_smooth()
### Aliases: gf_smooth gf_lm

### ** Examples

gf_smooth()
gf_lm()
if (require(mosaicData)) {
  gf_smooth(births ~ date, color = ~ wday, data = Births78)
  gf_smooth(births ~ date, color = ~ wday, data = Births78, fullrange = TRUE)
  gf_smooth(births ~ date, color = ~ wday, data = Births78, show.legend = FALSE, se = FALSE)
  gf_lm(length ~ width, data = KidsFeet, color = ~ biggerfoot, alpha = 0.2) %>%
    gf_point()
  gf_lm(length ~ width, data = KidsFeet, color = ~ biggerfoot, fullrange = FALSE, alpha = 0.2)
    gf_point()
  gf_lm(length ~ width, color = ~ sex, data = KidsFeet,
        formula = y ~ poly(x,2), linetype = "dashed") %>%
    gf_point()
  gf_lm(length ~ width, color = ~ sex, data = KidsFeet,
        formula = log(y) ~ x, backtrans = exp) %>%
    gf_point()
}
gf_lm(hwy ~ displ, data = mpg,
      formula = log(y) ~ poly(x,3), backtrans = exp,
     interval = "prediction", fill = "skyblue") %>%
  gf_lm(
     formula = log(y) ~ poly(x,3), backtrans = exp,
     interval = "confidence", color = "red") %>%
  gf_point()




