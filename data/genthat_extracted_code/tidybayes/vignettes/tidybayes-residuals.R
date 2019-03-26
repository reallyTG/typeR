params <-
list(EVAL = TRUE)

## ----chunk_options, include=FALSE----------------------------------------
knitr::opts_chunk$set(
  fig.width = 6, 
  fig.height = 4,
  eval = if (isTRUE(exists("params"))) params$EVAL else FALSE
)

## ----setup, message = FALSE, warning = FALSE-----------------------------
library(dplyr)
library(purrr)
library(tidyr)
library(tidybayes)
library(ggplot2)
library(ggridges)
library(cowplot)
library(rstan)
library(brms)
library(gganimate)

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
set.seed(4118)
n = 100

cens_df =
  tibble(
    y_star = rnorm(n, 0.5, 1),
    y_lower = floor(y_star),
    y_upper = ceiling(y_star),
    censoring = "interval"
  )

## ---------------------------------------------------------------------------------------------------------------------
head(cens_df, 10)

## ---- fig.width = 1.75, fig.height = 5--------------------------------------------------------------------------------
uncensored_plot = cens_df %>%
  ggplot(aes(y = "", x = y_star)) +
  geom_density_ridges(bandwidth = 0.5, scale = 1.5) +
  geom_jitter(aes(y = 0.75, color = ordered(y_lower)), position = position_jitter(height = 0.2), show.legend = FALSE) +
  ylab(NULL) +
  scale_x_continuous(breaks = -4:4, limits = c(-4, 4))

censored_plot = cens_df %>%
  ggplot(aes(y = "", x = (y_lower + y_upper)/2)) +
  geom_dotplot(
    aes(fill = ordered(y_lower)),
    method = "histodot", origin = -4, binwidth = 1, dotsize = 0.5, stackratio = .8, show.legend = FALSE,
    stackgroups = TRUE, binpositions = "all", color = NA
  ) +
  geom_segment(
    aes(x = y + 0.5, xend = y + 0.5, y = 1.75, yend = 1.5, color = ordered(y)),
    data = data.frame(y = unique(cens_df$y_lower)), show.legend = FALSE,
    arrow = arrow(type = "closed", length = unit(7, "points")), size = 1
  ) +
  ylab(NULL) +
  xlab("interval-censored y") +
  scale_x_continuous(breaks = -4:4, limits = c(-4, 4))

plot_grid(align = "v", ncol = 1, rel_heights = c(1, 2.5),
  uncensored_plot,
  censored_plot
)

## ---------------------------------------------------------------------------------------------------------------------
m_ideal = brm(y_star ~ 1, data = cens_df, family = student)

## ---------------------------------------------------------------------------------------------------------------------
m_ideal

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_residual_draws(m_ideal) %>%
  ggplot(aes(x = .row, y = .residual)) +
  stat_pointinterval()

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_residual_draws(m_ideal) %>%
  median_qi() %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_predicted_draws(m_ideal) %>%
  summarise(
    p_residual = mean(.prediction < y_star),
    z_residual = qnorm(p_residual)
  ) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline()

## ---------------------------------------------------------------------------------------------------------------------
m = brm(y_lower | cens(censoring, y_upper) ~ 1, data = cens_df)

## ---------------------------------------------------------------------------------------------------------------------
m

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_residual_draws(m) %>%
  ggplot(aes(x = .row, y = .residual)) +
  stat_pointinterval()

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_residual_draws(m) %>%
  median_qi(.residual) %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_predicted_draws(m) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = runif(1, p_lower, p_upper),
    z_residual = qnorm(p_residual)
  ) %>%
  ggplot(aes(x = .row, y = z_residual)) +
  geom_point()

## ---------------------------------------------------------------------------------------------------------------------
cens_df %>%
  add_predicted_draws(m) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = runif(1, p_lower, p_upper),
    z_residual = qnorm(p_residual)
  ) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline()

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = cens_df %>%
  add_predicted_draws(m) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = list(runif(k, p_lower, p_upper)),
    residual_draw = list(1:k)
  ) %>%
  unnest() %>%
  mutate(z_residual = qnorm(p_residual)) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline() +
  transition_manual(residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

## ---------------------------------------------------------------------------------------------------------------------
set.seed(41181)
n = 100

cens_df_t =
  tibble(
    y = rt(n, 3) + 0.5,
    y_lower = floor(y),
    y_upper = ceiling(y),
    censoring = "interval"
  )

## ---- fig.width = 4, fig.height = 5.75--------------------------------------------------------------------------------
uncensored_plot = cens_df_t %>%
  ggplot(aes(y = "", x = y)) +
  geom_density_ridges(bandwidth = 0.5, scale = 1.5) +
  geom_jitter(aes(y = 0.75, color = ordered(y_lower)), position = position_jitter(height = 0.2), show.legend = FALSE) +
  ylab(NULL) +
  scale_x_continuous(breaks = -10:10, limits = c(-10, 10))

censored_plot = cens_df_t %>%
  ggplot(aes(y = "", x = (y_lower + y_upper)/2)) +
  geom_dotplot(
    aes(fill = ordered(y_lower)),
    method = "histodot", origin = -4, binwidth = 1, dotsize = 0.5, stackratio = .8, show.legend = FALSE,
    stackgroups = TRUE, binpositions = "all", color = NA
  ) +
  geom_segment(
    aes(x = y + 0.5, xend = y + 0.5, y = 1.75, yend = 1.5, color = ordered(y)),
    data = data.frame(y = unique(cens_df_t$y_lower)), show.legend = FALSE,
    arrow = arrow(type = "closed", length = unit(7, "points")), size = 1
  ) +
  ylab(NULL) +
  xlab("interval-censored y") +
  scale_x_continuous(breaks = -10:10, limits = c(-10, 10))

plot_grid(align = "v", ncol = 1, rel_heights = c(1, 2.25),
  uncensored_plot,
  censored_plot
)

## ---------------------------------------------------------------------------------------------------------------------
m_t1 = brm(y_lower | cens(censoring, y_upper) ~ 1, data = cens_df_t)

## ---------------------------------------------------------------------------------------------------------------------
cens_df_t %>%
  add_residual_draws(m_t1) %>%
  median_qi(.residual) %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
cens_df_t %>%
  add_predicted_draws(m_t1) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = runif(1, p_lower, p_upper),
    z_residual = qnorm(p_residual)
  ) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline()

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = cens_df_t %>%
  add_predicted_draws(m_t1) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = list(runif(k, p_lower, p_upper)),
    residual_draw = list(1:k)
  ) %>%
  unnest() %>%
  mutate(z_residual = qnorm(p_residual)) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline() +
  transition_manual(residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

## ---------------------------------------------------------------------------------------------------------------------
m_t2 = brm(y_lower | cens(censoring, y_upper) ~ 1, data = cens_df_t, family = student)

## ---------------------------------------------------------------------------------------------------------------------
cens_df_t %>%
  add_residual_draws(m_t2) %>%
  median_qi(.residual) %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = cens_df_t %>%
  add_predicted_draws(m_t2) %>%
  summarise(
    p_lower = mean(.prediction < y_lower),
    p_upper = mean(.prediction < y_upper),
    p_residual = list(runif(k, p_lower, p_upper)),
    residual_draw = list(1:k)
  ) %>%
  unnest() %>%
  mutate(z_residual = qnorm(p_residual)) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline() +
  transition_manual(residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

## ---------------------------------------------------------------------------------------------------------------------
cens_df_o = cens_df_t %>%
  mutate(y_factor = ordered(y_lower))

## ---------------------------------------------------------------------------------------------------------------------
m_o = brm(y_factor ~ 1, data = cens_df_o, family = cumulative, 
  prior = prior(normal(0, 10), class = Intercept), control = list(adapt_delta = 0.99))

## ---- error = TRUE----------------------------------------------------------------------------------------------------
cens_df_o %>%
  add_residual_draws(m_o) %>%
  median_qi(.residual) %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
cens_df_o %>%
  add_predicted_draws(m_o) %>%
  mutate(.prediction = ordered(.prediction)) %>%
  summarise(
    p_lower = mean(.prediction < y_factor),
    p_upper = mean(.prediction <= y_factor),
    p_residual = runif(1, p_lower, p_upper),
    z_residual = qnorm(p_residual)
  ) %>%
  ggplot(aes(x = .row, y = z_residual)) +
  geom_point()

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = cens_df_o %>%
  add_predicted_draws(m_o) %>%
  mutate(.prediction = ordered(.prediction)) %>%
  summarise(
    p_lower = mean(.prediction < y_factor),
    p_upper = mean(.prediction <= y_factor),
    p_residual = list(runif(k, p_lower, p_upper)),
    residual_draw = list(1:k)
  ) %>%
  unnest() %>%
  mutate(z_residual = qnorm(p_residual)) %>%
  ggplot(aes(sample = z_residual)) +
  geom_qq() +
  geom_abline() +
  transition_manual(residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

## ---------------------------------------------------------------------------------------------------------------------
library(rlang)
make_probability_residuals = function(data, prediction, y, y_upper = NA, n = 1) {
  .prediction = enquo(prediction)
  .y = enquo(y)
  .y_upper = enquo(y_upper)

  if (eval_tidy(expr(is.factor(!!.prediction) && !is.ordered(!!.prediction)), data)) {
    data = mutate(data, !!.prediction := ordered(!!.prediction, levels = levels(!!.prediction)))
  }
  
  if (is.na(enquo(y_upper)[[2]])) {
    #no y_upper provided, use y as y_upper
    data = summarise(data,
      .p_lower = mean(!!.prediction < !!.y),
      .p_upper = mean(!!.prediction <= !!.y)
    )
  } else {
    #y_upper should be a vector, and if an entry in it is NA, use the entry from y
    data = summarise(data,
      .p_lower = mean(!!.prediction < !!.y),
      .p_upper = mean(!!.prediction <= ifelse(is.na(!!.y_upper), !!.y, !!.y_upper))
    )
  }
  
  data %>%
    mutate(
      .p_residual = map2(.p_lower, .p_upper, runif, n = !!n),
      .residual_draw = map(.p_residual, seq_along)
    ) %>%
    unnest(.p_residual, .residual_draw, .drop = FALSE) %>%
    mutate(.z_residual = qnorm(.p_residual))
}

## ---------------------------------------------------------------------------------------------------------------------
set.seed(51919)

bin_df = tibble(
  y = rbernoulli(100, .7)
)

## ---------------------------------------------------------------------------------------------------------------------
m_bin = brm(y ~ 1, data = bin_df, family = bernoulli)

## ---------------------------------------------------------------------------------------------------------------------
bin_df %>%
  add_residual_draws(m_bin) %>%
  median_qi() %>%
  ggplot(aes(sample = .residual)) +
  geom_qq() +
  geom_qq_line()

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = bin_df %>%
  add_predicted_draws(m_bin) %>%
  make_probability_residuals(.prediction, y, n = k) %>%
  ggplot(aes(sample = .z_residual)) +
  geom_qq() +
  geom_abline() +
  transition_manual(.residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

## ---------------------------------------------------------------------------------------------------------------------
k = 20

p = bin_df %>%
  add_predicted_draws(m_bin) %>%
  make_probability_residuals(.prediction, y, n = k) %>%
  ggplot(aes(sample = .p_residual)) +
  geom_qq(distribution = qunif) +
  geom_abline() +
  transition_manual(.residual_draw)

animate(p, nframes = k, width = 576, height = 384, res = 96, type = "cairo")

