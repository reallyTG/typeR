library(broom)


### Name: tidy.betareg
### Title: Tidy a(n) betareg object
### Aliases: tidy.betareg betareg_tidiers

### ** Examples


library(betareg)

data("GasolineYield", package = "betareg")

mod <- betareg(yield ~ batch + temp, data = GasolineYield)

mod
tidy(mod)
tidy(mod, conf.int = TRUE)
tidy(mod, conf.int = TRUE, conf.level = .99)

augment(mod)

glance(mod)




