context("Plots do what we expect")

# This does not do what it should
# There *should be* separate lines for each bootstrap trial.
data(SAT, package = "mosaicData")
mod1 <- lm(sat ~ poly(expend, 2), data = SAT)
mod_plot(mod1, ~ expend, bootstrap = 10) 

# Similarly, the confidence intervals aren't displayed nicely. We need to set `color = NA` when
# there is just a single explanatory variable.
mod_plot(mod1, interval = "confidence")