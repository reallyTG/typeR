library(broom)


### Name: glance.betareg
### Title: Glance at a(n) betareg object
### Aliases: glance.betareg

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




