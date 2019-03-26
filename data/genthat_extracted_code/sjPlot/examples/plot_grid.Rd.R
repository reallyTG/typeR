library(sjPlot)


### Name: plot_grid
### Title: Arrange list of plots as grid
### Aliases: plot_grid

### ** Examples

library(ggeffects)
data(efc)

# fit model
fit <- glm(
  tot_sc_e ~ c12hour + e17age + e42dep + neg_c_7,
  data = efc,
  family = poisson
)

# plot marginal effects for each predictor, each as single plot
p1 <- ggpredict(fit, "c12hour") %>%
  plot(show.y.title = FALSE, show.title = FALSE)
p2 <- ggpredict(fit, "e17age") %>%
  plot(show.y.title = FALSE, show.title = FALSE)
p3 <- ggpredict(fit, "e42dep") %>%
  plot(show.y.title = FALSE, show.title = FALSE)
p4 <- ggpredict(fit, "neg_c_7") %>%
  plot(show.y.title = FALSE, show.title = FALSE)

# plot grid
plot_grid(list(p1, p2, p3, p4))




