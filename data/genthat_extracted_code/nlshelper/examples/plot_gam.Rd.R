library(nlshelper)


### Name: plot_gam
### Title: Plot a generalized additive model
### Aliases: plot_gam

### ** Examples

data(Loblolly)
plot_gam(age, height, data=Loblolly)
plot_gam(age, height, Seed, data=Loblolly, band=FALSE, lines.col="black")
plot_gam(age, height, Seed, data=Loblolly, band=FALSE, lines.col="black", fittype="lm")

data(ChickWeight)
plot_gam(Time, weight, Diet, R="Chick", data=ChickWeight, lines.col=rainbow(4))



