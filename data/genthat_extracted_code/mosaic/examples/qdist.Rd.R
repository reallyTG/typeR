library(mosaic)


### Name: qdist
### Title: Illustrated quantile calculations from distributions
### Aliases: qdist xqgamma xqt xqchisq xqf xqbinom xqpois xqgeom xqnbinom
###   xqbeta

### ** Examples

qdist("norm", seq(.1, .9, by = 0.10), 
      title = "Deciles of a normal distribution", show.legend = FALSE,
      pattern = "rings")
xqnorm(seq(.2, .8, by = 0.20), mean = 100, sd = 10)
qdist("unif", .5)
xqgamma(.5, shape = 3, scale = 4)
xqgamma(.5, shape = 3, scale = 4, color = "black")
xqbeta(.5, shape1 = .9, shape2 = 1.4, dlwd = 1)
xqchisq(c(.25,.5,.75), df = 3)
xcbinom(c(0.80, 0.90), size = 1000, prob = 0.40)
# displayed as if continuous
xcbinom(c(0.80, 0.90), size = 5000, prob = 0.40)
xpbinom(c(480, 500, 520), size = 1000, prob = 0.48)
xpbinom(c(40, 60), size = 100, prob = 0.5)
xqpois(c(0.25, 0.5, 0.75), lambda = 12)
xcpois(0.50, lambda = 12)
xcpois(0.50, lambda = 12, refinements = list(scale_color_brewer(type = "qual", palette = 5)))



