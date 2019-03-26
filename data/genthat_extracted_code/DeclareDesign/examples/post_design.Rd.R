library(DeclareDesign)


### Name: post_design
### Title: Explore your design
### Aliases: post_design get_estimates draw_data draw_estimands
###   draw_estimates print.design summary.design

### ** Examples


design <-
  declare_population(N = 500, noise = rnorm(N)) +
  declare_potential_outcomes(Y ~ noise + Z * rnorm(N, 2, 2)) +
  declare_sampling(n = 250) +
  declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0)) +
  declare_step(dplyr::mutate, noise_sq = noise^2) +
  declare_assignment(m = 25) +
  declare_reveal() +
  declare_estimator(Y ~ Z, estimand = "my_estimand")

design

df <- draw_data(design)

estimates <- draw_estimates(design)
estimands <- draw_estimands(design)


my_population <- declare_population(N = 500, noise = rnorm(N))

my_potential_outcomes <- declare_potential_outcomes(
  Y_Z_0 = noise, Y_Z_1 = noise +
  rnorm(N, mean = 2, sd = 2))

my_sampling <- declare_sampling(n = 250)

my_assignment <- declare_assignment(m = 25)

my_estimand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))

my_estimator <- declare_estimator(Y ~ Z, estimand = my_estimand)

my_mutate <- declare_step(dplyr::mutate, noise_sq = noise ^ 2)

my_reveal <- declare_reveal()

design <- my_population +
  my_potential_outcomes +
  my_sampling +
  my_estimand +
  my_mutate +
  my_assignment +
  my_reveal +
  my_estimator

summary(design)



