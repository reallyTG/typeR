library(ggeffects)


### Name: plot
### Title: Plot ggeffects-objects
### Aliases: plot plot.ggeffects theme_ggeffects show_pals

### ** Examples

library(sjlabelled)
data(efc)
efc$c172code <- as_label(efc$c172code)
fit <- lm(barthtot ~ c12hour + neg_c_7 + c161sex + c172code, data = efc)

dat <- ggpredict(fit, terms = "c12hour")
plot(dat)

dat <- ggpredict(fit, terms = "c12hour", full.data = TRUE)
plot(dat)

dat <- ggaverage(fit, terms = "neg_c_7")
plot(dat)
plot(dat, ci = "dash")

# facet by group, use pre-defined color palette
dat <- ggpredict(fit, terms = c("c12hour", "c172code"))
plot(dat, facet = TRUE, colors = "hero")

# don't use facets, b/w figure, w/o confidence bands
dat <- ggaverage(fit, terms = c("c12hour", "c172code"))
plot(dat, colors = "bw", ci = FALSE)

# factor at x axis, plot exact data points and error bars
dat <- ggpredict(fit, terms = c("c172code", "c161sex"))
plot(dat)

# for three variables, automatic facetting
dat <- ggpredict(fit, terms = c("c12hour", "c172code", "c161sex"))
plot(dat)





