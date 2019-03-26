params <-
list(EVAL = TRUE)

## ----chunk_options, include=FALSE----------------------------------------
knitr::opts_chunk$set(
  fig.width = 6, 
  fig.height = 4,
  eval = if (isTRUE(exists("params"))) params$EVAL else FALSE
)

## ----setup, message = FALSE, warning = FALSE-----------------------------
library(magrittr)
library(dplyr)
library(forcats)
library(tidyr)
library(purrr)
library(modelr)
library(tidybayes)
library(ggplot2)
library(ggstance)
library(ggridges)
library(rstan)
library(rstanarm)
library(cowplot)

theme_set(theme_tidybayes() + panel_border() + background_grid())

## ---- eval=FALSE---------------------------------------------------------
#  rstan_options(auto_write = TRUE)
#  options(mc.cores = parallel::detectCores())

## ----hidden_options, include=FALSE------------------------------------------------------------------------------------
# While the previous code chunk is the actual recommended approach,
# CRAN vignette building policy limits us to 2 cores, so we use at most
# 2 to build this vignette (but show the previous chunk to
# the reader as a best pratice example)
rstan_options(auto_write = TRUE)
options(mc.cores = min(2, parallel::detectCores()))

options(width = 120)

## ---------------------------------------------------------------------------------------------------------------------
set.seed(5)
n = 10
n_condition = 5
ABC =
  data_frame(
    condition = rep(c("A","B","C","D","E"), n),
    response = rnorm(n * 5, c(0,1,2,1,-1), 0.5)
  )

## ---------------------------------------------------------------------------------------------------------------------
head(ABC, 10)

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  ggplot(aes(y = condition, x = response)) +
  geom_point()

## ---------------------------------------------------------------------------------------------------------------------
m = stan_lmer(response ~ (1|condition), data = ABC, 
  prior = normal(0, 1, autoscale = FALSE),
  prior_aux = student_t(3, 0, 1, autoscale = FALSE),
  adapt_delta = .99)

## ---------------------------------------------------------------------------------------------------------------------
m

## ---------------------------------------------------------------------------------------------------------------------
get_variables(m)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(b[term,group]) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(b[t,g]) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(b[,group]) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>% 
  spread_draws(b[,group]) %>%
  separate(group, c("group", "condition"), ":") %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>% 
  spread_draws(b[,group,condition], sep = "[, :]") %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, sigma) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, sigma) %>%
  median_qi(`(Intercept)`, sigma)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, sigma) %>%
  median_qi()

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  gather_draws(`(Intercept)`, sigma) %>%
  median_qi()

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(b[,group]) %>%
  median_qi()

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(b[,group]) %>%
  group_by(group) %>%       # this line not necessary (done by spread_draws)
  median_qi(b)                # b is not necessary (it is the only non-group column)

## ---------------------------------------------------------------------------------------------------------------------
m %>% 
  spread_draws(`(Intercept)`, b[,group]) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  mutate(condition_mean = `(Intercept)` + b) %>%
  median_qi(condition_mean)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  median_qi(condition_mean = `(Intercept)` + b)

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  median_qi(condition_mean = `(Intercept)` + b) %>%
  ggplot(aes(y = group, x = condition_mean, xmin = .lower, xmax = .upper)) +
  geom_pointrangeh()

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  median_qi(condition_mean = `(Intercept)` + b, .width = c(.95, .8, .5))

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  median_qi(condition_mean = `(Intercept)` + b, .width = c(.95, .66)) %>%
  ggplot(aes(y = group, x = condition_mean)) +
  geom_pointintervalh() 

## ---------------------------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`(Intercept)`, b[,group]) %>%
  mutate(condition_mean = `(Intercept)` + b) %>%
  ggplot(aes(y = group, x = condition_mean)) +
  geom_halfeyeh() 

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  data_grid(condition) %>%
  add_fitted_draws(m) %>%
  head(10)

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  data_grid(condition) %>%
  add_fitted_draws(m) %>%
  ggplot(aes(x = .value, y = condition)) +
  stat_pointintervalh(.width = c(.66, .95))

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  data_grid(condition) %>%
  add_fitted_draws(m) %>%
  do(data_frame(.value = quantile(.$.value, ppoints(100)))) %>%
  ggplot(aes(x = .value)) +
  geom_dotplot(binwidth = .04) +
  facet_grid(fct_rev(condition) ~ .) +
  scale_y_continuous(breaks = NULL)

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  data_grid(condition) %>%
  add_predicted_draws(m) %>%
  ggplot(aes(x = .prediction, y = condition)) +
  geom_density_ridges()

## ---------------------------------------------------------------------------------------------------------------------
ABC %>%
  data_grid(condition) %>%
  add_predicted_draws(m) %>%
  ggplot(aes(y = condition, x = .prediction)) +
  stat_intervalh() +
  geom_point(aes(x = response), data = ABC) +
  scale_color_brewer()

## ---------------------------------------------------------------------------------------------------------------------
grid = ABC %>%
  data_grid(condition)

fits = grid %>%
  add_fitted_draws(m)

preds = grid %>%
  add_predicted_draws(m)

ABC %>%
  ggplot(aes(y = condition, x = response)) +
  stat_intervalh(aes(x = .prediction), data = preds) +
  stat_pointintervalh(aes(x = .value), data = fits, .width = c(.66, .95), position = position_nudge(y = -0.2)) +
  geom_point() +
  scale_color_brewer()

## ---- results = "hide", message = FALSE, warning = FALSE--------------------------------------------------------------
m_mpg = stan_glm(mpg ~ hp * cyl, data = mtcars)

## ---------------------------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 51)) %>%
  add_fitted_draws(m_mpg) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
  stat_lineribbon(aes(y = .value)) +
  geom_point(data = mtcars) +
  scale_fill_brewer(palette = "Greys") +
  scale_color_brewer(palette = "Set2")

## ---------------------------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 101)) %>%
  add_fitted_draws(m_mpg, n = 100) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
  geom_line(aes(y = .value, group = paste(cyl, .draw)), alpha = .1) +
  geom_point(data = mtcars) +
  scale_color_brewer(palette = "Dark2")

## ---------------------------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 101)) %>%
  add_predicted_draws(m_mpg) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl), fill = ordered(cyl))) +
  stat_lineribbon(aes(y = .prediction), .width = c(.95, .80, .50), alpha = 1/4) +
  geom_point(data = mtcars) +
  scale_fill_brewer(palette = "Set2") +
  scale_color_brewer(palette = "Dark2")

## ---------------------------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 101)) %>%
  add_predicted_draws(m_mpg) %>%
  ggplot(aes(x = hp, y = mpg)) +
  stat_lineribbon(aes(y = .prediction), .width = c(.99, .95, .8, .5)) +
  geom_point(data = mtcars) +
  scale_fill_brewer() +
  facet_grid(. ~ cyl)

## ---- fig.width=7-----------------------------------------------------------------------------------------------------
#N.B. the syntax for compare_levels is experimental and may change
m %>%
  spread_draws(b[,,condition], sep = "[, :]") %>%
  compare_levels(b, by = condition) %>%
  ggplot(aes(y = condition, x = b)) +
  geom_halfeyeh()

## ---- fig.width=7-----------------------------------------------------------------------------------------------------
#N.B. the syntax for compare_levels is experimental and may change
m %>%
  spread_draws(b[,,condition], sep = "[, :]") %>%
  compare_levels(b, by = condition) %>%
  ungroup() %>%
  mutate(condition = reorder(condition, b)) %>%
  ggplot(aes(y = condition, x = b)) +
  geom_halfeyeh() +
  geom_vline(xintercept = 0, linetype = "dashed") 

## ---------------------------------------------------------------------------------------------------------------------
data(esoph)
m_esoph_rs = stan_polr(tobgp ~ agegp, data = esoph, prior = R2(0.25), prior_counts = dirichlet(1))

## ---------------------------------------------------------------------------------------------------------------------
esoph %>%
  data_grid(agegp) %>%
  add_fitted_draws(m_esoph_rs, scale = "linear") %>%
  ggplot(aes(x = as.numeric(agegp), y = .value)) +
  stat_lineribbon() +
  scale_fill_brewer(palette = "Greys")

## ---------------------------------------------------------------------------------------------------------------------
get_variables(m_esoph_rs)

## ---------------------------------------------------------------------------------------------------------------------
thresholds = m_esoph_rs %>%
  gather_draws(`.*[|].*`, regex = TRUE) %>%
  group_by(.draw) %>%
  select(.draw, threshold = .value) %>%
  summarise_all(list) %>%
  mutate(threshold = map(threshold, ~ c(., Inf)))

head(thresholds, 10)

## ---------------------------------------------------------------------------------------------------------------------
thresholds[1,]$threshold

## ---------------------------------------------------------------------------------------------------------------------
esoph %>%
  data_grid(agegp) %>%
  add_fitted_draws(m_esoph_rs, scale = "linear") %>%
  inner_join(thresholds, by = ".draw") %>%
  mutate(`P(Y = category)` = map2(threshold, .value, function(alpha, beta_x)
      # this part is logit^-1(alpha_j - beta*x) - logit^-1(alpha_j-1 - beta*x)
      LaplacesDemon::invlogit(alpha - beta_x) - 
      LaplacesDemon::invlogit(lag(alpha, default = -Inf) - beta_x)
    )) %>%
  mutate(.category = list(levels(esoph$tobgp))) %>%
  unnest() %>%
  ggplot(aes(x = agegp, y = `P(Y = category)`, color = .category)) +
  stat_pointinterval(position = position_dodge(width = .4), show.legend = TRUE) +
  scale_size_continuous(guide = FALSE) +
  scale_fill_brewer(palette = "Greys") 

## ----fig.height = 2.25, fig.width = 8---------------------------------------------------------------------------------
esoph %>%
  data_grid(agegp) %>%
  add_fitted_draws(m_esoph_rs, scale = "linear") %>%
  inner_join(thresholds, by = ".draw") %>%
  mutate(`P(Y = category)` = map2(threshold, .value, function(alpha, beta_x)
      # this part is logit^-1(alpha_j - beta*x) - logit^-1(alpha_j-1 - beta*x)
      LaplacesDemon::invlogit(alpha - beta_x) - 
      LaplacesDemon::invlogit(lag(alpha, default = -Inf) - beta_x)
    )) %>%
  mutate(.category = list(levels(esoph$tobgp))) %>%
  unnest() %>%
  ggplot(aes(x = `P(Y = category)`, y = .category)) +
  stat_summaryh(fun.x = median, geom = "barh", fill = "gray75", width = 1, color = "white") +
  stat_pointintervalh() +
  coord_cartesian(expand = FALSE) +
  facet_grid(. ~ agegp, switch = "x") +
  theme_classic() +
  theme(strip.background = element_blank(), strip.placement = "outside") +
  ggtitle("P(tobacco consumption category | age group)") +
  xlab("age group")

