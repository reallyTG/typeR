## ----set-knitr-options, cache=FALSE, echo=FALSE--------------------------
library("knitr")
opts_chunk$set(message = FALSE, fig.width = 5.5)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(glmmfields)
library(ggplot2)
library(dplyr)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  options(mc.cores = parallel::detectCores())

## ----simulate-data-------------------------------------------------------
set.seed(1)
N <- 200 # number of data points
temperature <- rnorm(N, 0, 1) # simulated temperature data
X <- cbind(1, temperature) # our design matrix
s <- sim_glmmfields(
  n_draws = 1, gp_theta = 1.5, n_data_points = N,
  gp_sigma = 0.2, sd_obs = 0.2, n_knots = 12, obs_error = "gamma",
  covariance = "squared-exponential", X = X,
  B = c(0.5, 0.2) # B represents our intercept and slope
)
d <- s$dat
d$temperature <- temperature
ggplot(s$dat, aes(lon, lat, colour = y)) +
  viridis::scale_colour_viridis() +
  geom_point(size = 3)

## ------------------------------------------------------------------------
m_glm <- glm(y ~ temperature, data = d, family = Gamma(link = "log"))
m_glm
confint(m_glm)
d$m_glm_residuals <- residuals(m_glm)
ggplot(d, aes(lon, lat, colour = m_glm_residuals)) +
  scale_color_gradient2() +
  geom_point(size = 3)

## ---- results='hide'-----------------------------------------------------
m_spatial <- glmmfields(y ~ temperature,
  data = d, family = Gamma(link = "log"),
  lat = "lat", lon = "lon", nknots = 12, iter = 500, chains = 1,
  prior_intercept = student_t(3, 0, 10), 
  prior_beta = student_t(3, 0, 3),
  prior_sigma = half_t(3, 0, 3),
  prior_gp_theta = half_t(3, 0, 10),
  prior_gp_sigma = half_t(3, 0, 3),
  seed = 123 # passed to rstan::sampling()
)

## ------------------------------------------------------------------------
m_spatial

## ------------------------------------------------------------------------
plot(m_spatial, type = "spatial-residual", link = TRUE) +
  geom_point(size = 3)

## ------------------------------------------------------------------------
plot(m_spatial, type = "residual-vs-fitted")

## ------------------------------------------------------------------------
plot(m_spatial, type = "prediction", link = FALSE) +
  viridis::scale_colour_viridis() +
  geom_point(size = 3)

## ------------------------------------------------------------------------
# link scale:
p <- predict(m_spatial)
head(p)

# response scale:
p <- predict(m_spatial, type = "response")
head(p)

# prediction intervals on new observations (include observation error):
p <- predict(m_spatial, type = "response", interval = "prediction")
head(p)

## ------------------------------------------------------------------------
head(tidy(m_spatial, conf.int = TRUE, conf.method = "HPDinterval"))

## ------------------------------------------------------------------------
pred_grid <- expand.grid(lat = seq(min(d$lat), max(d$lat), length.out = 30),
  lon = seq(min(d$lon), max(d$lon), length.out = 30))
pred_grid$temperature <- mean(d$temperature)
pred_grid$prediction <- predict(m_spatial, newdata = pred_grid, 
  type = "response")$estimate
ggplot(pred_grid, aes(lon, lat, fill = prediction)) + 
  geom_raster() +
  viridis::scale_fill_viridis()

