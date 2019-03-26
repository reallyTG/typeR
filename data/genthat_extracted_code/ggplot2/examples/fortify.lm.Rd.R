library(ggplot2)


### Name: fortify.lm
### Title: Supplement the data fitted to a linear model with model fit
###   statistics.
### Aliases: fortify.lm
### Keywords: internal

### ** Examples

mod <- lm(mpg ~ wt, data = mtcars)
head(fortify(mod))
head(fortify(mod, mtcars))

plot(mod, which = 1)

ggplot(mod, aes(.fitted, .resid)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_smooth(se = FALSE)

ggplot(mod, aes(.fitted, .stdresid)) +
  geom_point() +
  geom_hline(yintercept = 0) +
  geom_smooth(se = FALSE)

ggplot(fortify(mod, mtcars), aes(.fitted, .stdresid)) +
  geom_point(aes(colour = factor(cyl)))

ggplot(fortify(mod, mtcars), aes(mpg, .stdresid)) +
  geom_point(aes(colour = factor(cyl)))

plot(mod, which = 2)
ggplot(mod) +
  stat_qq(aes(sample = .stdresid)) +
  geom_abline()

plot(mod, which = 3)
ggplot(mod, aes(.fitted, sqrt(abs(.stdresid)))) +
  geom_point() +
  geom_smooth(se = FALSE)

plot(mod, which = 4)
ggplot(mod, aes(seq_along(.cooksd), .cooksd)) +
  geom_col()

plot(mod, which = 5)
ggplot(mod, aes(.hat, .stdresid)) +
  geom_vline(size = 2, colour = "white", xintercept = 0) +
  geom_hline(size = 2, colour = "white", yintercept = 0) +
  geom_point() + geom_smooth(se = FALSE)

ggplot(mod, aes(.hat, .stdresid)) +
  geom_point(aes(size = .cooksd)) +
  geom_smooth(se = FALSE, size = 0.5)

plot(mod, which = 6)
ggplot(mod, aes(.hat, .cooksd)) +
  geom_vline(xintercept = 0, colour = NA) +
  geom_abline(slope = seq(0, 3, by = 0.5), colour = "white") +
  geom_smooth(se = FALSE) +
  geom_point()

ggplot(mod, aes(.hat, .cooksd)) +
  geom_point(aes(size = .cooksd / .hat)) +
  scale_size_area()



