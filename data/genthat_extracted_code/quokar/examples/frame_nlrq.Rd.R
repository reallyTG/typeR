library(quokar)


### Name: frame_nlrq
### Title: Visualization of fitting process of non-linear quantile
###   regression: interior point algorithm
### Aliases: frame_nlrq

### ** Examples

library(tidyr)
library(ggplot2)
library(purrr)
x <- rep(1:25, 20)
y <- SSlogis(x, 10, 12, 2) * rnorm(500, 1, 0.1)
Dat <- data.frame(x = x, y = y)
formula <- y ~ SSlogis(x, Aysm, mid, scal)
nlrq_m <- frame_nlrq(formula, data = Dat, tau = c(0.1, 0.5, 0.9))
weights <- nlrq_m$weights
m <- data.frame(Dat, weights)
m_f <- m %>% gather(tau_flag, value, -x, -y)
ggplot(m_f, aes(x = x, y = y)) +
  geom_point(aes(size = value, colour = tau_flag)) +
  facet_wrap(~tau_flag)



