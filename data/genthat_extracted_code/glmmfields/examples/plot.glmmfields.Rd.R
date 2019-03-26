library(glmmfields)


### Name: plot.glmmfields
### Title: Plot predictions from an glmmfields model
### Aliases: plot.glmmfields

### ** Examples

## No test: 
# Spatiotemporal example:
set.seed(1)
s <- sim_glmmfields(n_draws = 12, n_knots = 12, gp_theta = 1.5,
gp_sigma = 0.2, sd_obs = 0.1)
# options(mc.cores = parallel::detectCores()) # for parallel processing
m <- glmmfields(y ~ 0, time = "time",
 lat = "lat", lon = "lon", data = s$dat,
 nknots = 12, iter = 600, chains = 1)
x <- plot(m, type = "prediction")
x
x + ggplot2::scale_color_gradient2()
plot(m, type = "spatial-residual")
plot(m, type = "residual-vs-fitted")
## End(No test)



