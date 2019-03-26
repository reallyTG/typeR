library(ggformula)


### Name: stat_lm
### Title: Linear Model Displays
### Aliases: stat_lm geom_lm

### ** Examples

if (require(mosaicData)) {
  ggplot(data = KidsFeet, aes(y = length, x = width, color = sex)) +
    geom_lm() +
    geom_point()
  ggplot(data = KidsFeet, aes(y = length, x = width, color = sex)) +
    geom_lm(interval = "prediction", color = "skyblue") +
    geom_lm(interval = "confidence") +
    geom_point() +
    facet_wrap(~sex)
 # non-standard display
  ggplot(data = KidsFeet, aes(y = length, x = width, color = sex)) +
    stat_lm(aes(fill = sex), color = NA, interval = "confidence", geom = "ribbon",
    alpha = 0.2) +
    geom_point() +
    facet_wrap(~sex)
ggplot(mpg, aes(displ, hwy)) +
   geom_lm(formula = log(y) ~ poly(x,3), backtrans = exp,
     interval = "prediction", fill = "skyblue") +
   geom_lm(formula = log(y) ~ poly(x,3), backtrans = exp, interval = "confidence",
     color = "red") +
   geom_point()
}



