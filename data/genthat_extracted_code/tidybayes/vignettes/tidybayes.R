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
library(ggplot2)
library(ggstance)
library(emmeans)
library(broom)
library(rstan)
library(rstanarm)
library(brms)
library(modelr)
library(bayesplot)
library(MCMCglmm)
library(tidybayes)
library(cowplot)

theme_set(theme_tidybayes() + panel_border() + background_grid())

## ---- eval=FALSE---------------------------------------------------------
#  rstan_options(auto_write = TRUE)
#  options(mc.cores = parallel::detectCores())

## ----hidden_options, include=FALSE----------------------------------------------------------------
# While the previous code chunk is the actual recommended approach,
# CRAN vignette building policy limits us to 2 cores, so we use at most
# 2 to build this vignette (but show the previous chunk to
# the reader as a best pratice example)
rstan_options(auto_write = TRUE)
options(mc.cores = min(2, parallel::detectCores()))

options(width = 100)

## -------------------------------------------------------------------------------------------------
set.seed(5)
n = 10
n_condition = 5
ABC =
  data_frame(
    condition = rep(c("A","B","C","D","E"), n),
    response = rnorm(n * 5, c(0,1,2,1,-1), 0.5)
  )

## -------------------------------------------------------------------------------------------------
head(ABC, 10)

## -------------------------------------------------------------------------------------------------
ABC %>%
  ggplot(aes(x = response, y = fct_rev(condition))) +
  geom_point(alpha = 0.5) +
  ylab("condition")

## -------------------------------------------------------------------------------------------------
compose_data(ABC)

## -------------------------------------------------------------------------------------------------
m = sampling(ABC_stan, data = compose_data(ABC), control = list(adapt_delta=0.99))

## -------------------------------------------------------------------------------------------------
print(m, pars = c("overall_mean", "condition_mean_sd", "condition_mean", "response_sd"))

## -------------------------------------------------------------------------------------------------
str(rstan::extract(m))

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  recover_types(ABC) %>%
  spread_draws(condition_mean[condition]) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %<>% recover_types(ABC)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(overall_mean, response_sd) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(overall_mean, response_sd) %>%
  median_qi(overall_mean, response_sd)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(overall_mean, response_sd) %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  group_by(condition) %>%    # this line not necessary (done automatically by spread_draws)
  median_qi(condition_mean)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi() %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean, xmin = .lower, xmax = .upper)) +
  geom_pointintervalh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi() %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_pointintervalh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  stat_pointintervalh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_violinh(color = NA, fill = "gray65") +
  stat_pointintervalh(.width = c(.95, .66))

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_eyeh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_halfeyeh(.width = c(.99, .8))

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi(.width = c(.95, .8, .5))

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi(.width = c(.95, .66)) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean, 
    size = -.width)) +               # smaller probability interval => thicker line
  geom_pointintervalh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi(.width = c(.95, .66)) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_pointintervalh()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi(.width = c(.95, .8, .5)) %>%
  ggplot(aes(y = fct_rev(condition), x = condition_mean)) +
  geom_pointintervalh(size_range = c(0.5, 2))

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  do(data_frame(condition_mean = quantile(.$condition_mean, ppoints(100)))) %>%
  ggplot(aes(x = condition_mean)) +
  geom_dotplot(binwidth = .04) +
  facet_grid(fct_rev(condition) ~ .) +
  scale_y_continuous(breaks = NULL)

## -------------------------------------------------------------------------------------------------
set.seed(123)
multimodal_draws = data_frame(
  x = c(rnorm(5000, 0, 1), rnorm(2500, 4, 1))
)

## -------------------------------------------------------------------------------------------------
multimodal_draws %>%
  mode_hdi(x, .width = .80)

## ---- fig.height = 3, fig.width = 8---------------------------------------------------------------
multimodal_draws %>%
  ggplot(aes(x = x)) +
  stat_density(fill = "gray75") +
  stat_pointintervalh(aes(y = -0.05), point_interval = median_qi, .width = c(.95, .80)) +
  annotate("text", label = "median, 80% and 95% quantile intervals", x = 6, y = -0.05, hjust = 0, vjust = 0.3) +
  stat_pointintervalh(aes(y = -0.025), point_interval = mode_hdi, .width = c(.95, .80)) +
  annotate("text", label = "mode, 80% and 95% highest-density intervals", x = 6, y = -0.025, hjust = 0, vjust = 0.3) +
  xlim(-3.5, 14.5)

## -------------------------------------------------------------------------------------------------
m %>% 
  spread_draws(overall_mean, condition_mean[condition]) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(overall_mean, condition_mean[condition]) %>%
  mutate(condition_offset = condition_mean - overall_mean) %>%
  median_qi(condition_offset)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition], response_sd) %>%
  mutate(y_rep = rnorm(n(), condition_mean, response_sd)) %>%
  ggplot(aes(x = y_rep)) +
  stat_density(fill = "gray75") +
  facet_grid(condition ~ ., switch = "y")

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition], response_sd) %>%
  mutate(y_rep = rnorm(n(), condition_mean, response_sd)) %>%
  median_qi(y_rep, .width = c(.95, .8, .5)) %>%
  ggplot(aes(y = fct_rev(condition), x = y_rep)) +
  geom_intervalh() + #auto-sets aes(xmin = .lower, xmax = .upper, color = fct_rev(ordered(.width)))
  geom_point(aes(x = response), data = ABC) +
  scale_color_brewer()

## -------------------------------------------------------------------------------------------------
draws = m %>%
  spread_draws(condition_mean[condition], response_sd)

reps = draws %>%
  mutate(y_rep = rnorm(n(), condition_mean, response_sd)) %>%
  median_qi(y_rep, .width = c(.95, .8, .5))

means = draws %>%
  median_qi(condition_mean, .width = c(.95, .66))

ABC %>%
  ggplot(aes(y = condition)) +
  geom_intervalh(aes(x = y_rep), data = reps) +
  geom_pointintervalh(aes(x = condition_mean), position = position_nudge(y = -0.2), data = means) +
  geom_point(aes(x = response)) +
  scale_color_brewer()

## ---- fig.width=7---------------------------------------------------------------------------------
#N.B. the syntax for compare_levels is experimental and may change
m %>%
  spread_draws(condition_mean[condition]) %>%
  compare_levels(condition_mean, by = condition) %>%
  ggplot(aes(y = condition, x = condition_mean)) +
  geom_halfeyeh()

## -------------------------------------------------------------------------------------------------
m %>%
  gather_draws(overall_mean, condition_mean[condition]) %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(overall_mean, condition_mean[condition]) %>%
  mutate(condition_offset = condition_mean - overall_mean) %>%
  gather_variables() %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m %>%
  tidy_draws() %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  tidy_draws() %>%
  gather_variables() %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(`condition_.*`[condition], regex = TRUE) %>%
  head(10)

## ---- results = "hide", message = FALSE, warning = FALSE------------------------------------------
m_mpg = brm(mpg ~ hp * cyl, data = mtcars)

## -------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 51)) %>%
  add_fitted_draws(m_mpg) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
  stat_lineribbon(aes(y = .value)) +
  geom_point(data = mtcars) +
  scale_fill_brewer(palette = "Greys") +
  scale_color_brewer(palette = "Set2")

## -------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 101)) %>%
  add_fitted_draws(m_mpg, n = 100) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl))) +
  geom_line(aes(y = .value, group = paste(cyl, .draw)), alpha = .1) +
  geom_point(data = mtcars) +
  scale_color_brewer(palette = "Dark2")

## -------------------------------------------------------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  data_grid(hp = seq_range(hp, n = 101)) %>%
  add_predicted_draws(m_mpg) %>%
  ggplot(aes(x = hp, y = mpg, color = ordered(cyl), fill = ordered(cyl))) +
  stat_lineribbon(aes(y = .prediction), .width = c(.95, .80, .50), alpha = 1/4) +
  geom_point(data = mtcars) +
  scale_fill_brewer(palette = "Set2") +
  scale_color_brewer(palette = "Dark2")

## -------------------------------------------------------------------------------------------------
m_linear = lm(response ~ condition, data = ABC)

## -------------------------------------------------------------------------------------------------
linear_results = m_linear %>% 
  emmeans(~ condition) %>% 
  tidy() %>%
  mutate(model = "OLS")

linear_results

## -------------------------------------------------------------------------------------------------
bayes_results = m %>%
  spread_draws(condition_mean[condition]) %>%
  median_qi(estimate = condition_mean) %>%
  to_broom_names() %>%
  mutate(model = "Bayes")

bayes_results

## -------------------------------------------------------------------------------------------------
bind_rows(linear_results, bayes_results) %>%
  mutate(condition = fct_rev(condition)) %>%
  ggplot(aes(y = condition, x = estimate, xmin = conf.low, xmax = conf.high, color = model)) +
  geom_pointrangeh(position = position_dodgev(height = .3))

## ---- warning = FALSE-----------------------------------------------------------------------------
bind_rows(linear_results, bayes_results) %>%
  rename(term = condition) %>%
  dotwhisker::dwplot()

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  compare_levels(condition_mean, by = condition) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  compare_levels(condition_mean, by = condition) %>%
  unspread_draws(condition_mean[condition]) %>%
  head(10)

## -------------------------------------------------------------------------------------------------
m %>%
  spread_draws(condition_mean[condition]) %>%
  compare_levels(condition_mean, by = condition) %>%
  unspread_draws(condition_mean[condition], drop_indices = TRUE) %>%
  mcmc_areas()

## -------------------------------------------------------------------------------------------------
m_rst = stan_glm(response ~ condition, data = ABC)

## -------------------------------------------------------------------------------------------------
m_rst %>%
  emmeans( ~ condition) %>%
  gather_emmeans_draws() %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m_rst %>%
  emmeans( ~ condition) %>%
  contrast(method = "pairwise") %>%
  gather_emmeans_draws() %>%
  median_qi()

## -------------------------------------------------------------------------------------------------
m_rst %>%
  emmeans( ~ condition) %>%
  contrast(method = "pairwise") %>%
  gather_emmeans_draws() %>%
  ggplot(aes(x = .value, y = contrast)) +
  geom_halfeyeh()

## -------------------------------------------------------------------------------------------------
# MCMCglmm does not support tibbles directly,
# so we convert ABC to a data.frame on the way in
m_glmm = MCMCglmm(response ~ condition, data = as.data.frame(ABC))

## -------------------------------------------------------------------------------------------------
m_glmm %>%
  emmeans( ~ condition, data = ABC) %>%
  contrast(method = "pairwise") %>%
  gather_emmeans_draws() %>%
  ggplot(aes(x = .value, y = contrast)) +
  geom_halfeyeh()

