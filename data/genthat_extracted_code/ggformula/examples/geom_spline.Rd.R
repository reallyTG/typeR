library(ggformula)


### Name: stat_spline
### Title: Geoms and stats for spline smoothing
### Aliases: stat_spline geom_spline

### ** Examples

if (require(mosaicData)) {
  ggplot(Births) + geom_spline(aes(x = date, y=births, colour = wday))
  ggplot(Births) + geom_spline(aes(x = date, y=births, colour = wday), nknots = 10)
}




