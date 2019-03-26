library(hIRT)


### Name: latent_scores
### Title: Estimates of Latent Preferences/Abilities
### Aliases: latent_scores

### ** Examples

y <- nes_econ2008[, -(1:3)]
x <- model.matrix( ~ party * educ, nes_econ2008)
z <- model.matrix( ~ party, nes_econ2008)
nes_m1 <- hgrm(y, x, z)
pref <- latent_scores(nes_m1)
require(ggplot2)
ggplot(data = nes_econ2008) +
geom_density(aes(x = pref$est, col = party))



