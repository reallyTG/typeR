## ---- fig.height=3.5, fig.width=5----------------------------------------
# load package
library(metaBMA)
# load data set
data(towels)

# Half-normal (truncated to > 0)
p1 <- prior("halfnorm", c(mean=0, sd=.3))
p1
p1(1:3)
plot(p1)

# custom prior
p1 <- prior("custom",  function(x) x^3-2*x+3, "d", 0, 1)
plot(p1, -.5, 1.5)

# field- and effect-specific default priors
plot_default(field = "psychology", effect = "ttest")

## ---- fig.height=3.5, fig.width=5----------------------------------------
# Fixed-effects
mf <- meta_fixed(towels$logOR, towels$SE, towels$study,
                 d = "halfnorm",d.par = c(0, .3))
mf

# plot posterior distribution
plot_posterior(mf)

## ---- fig.height=3.5, fig.width=5----------------------------------------
# Random-effects
mr <- meta_random(towels$logOR, towels$SE, towels$study,
                  tau = "halfcauchy",tau.par = .5,
                  d = "halfnorm",d.par = c(0,.3))
mr

# plot posterior distribution
plot_posterior(mr, main = "Total effect size")
plot_posterior(mr, "tau", main = "Heterogeneity tau")

## ---- fig.height=4.5, fig.width=6----------------------------------------
mb <- meta_bma(towels$logOR, towels$SE, towels$study,
                d = "halfnorm", d.par = c(0, .3),
                tau = "halfcauchy", tau.par = .5)
mb
plot_posterior(mb, "d", -.1, 1.4)
plot_forest(mb)

## ---- eval=FALSE---------------------------------------------------------
#  md <- meta_default(towels$logOR, towels$SE, towels$study,
#                     field = "psychology", effect = "logOR")
#  md

## ---- fig.height=4.5, fig.width=6----------------------------------------
mp <- predictive(mb, SE = .2, resample = 50)
plot(mp)

