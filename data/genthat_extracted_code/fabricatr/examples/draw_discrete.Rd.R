library(fabricatr)


### Name: draw_discrete
### Title: Draw discrete variables including binary, binomial count,
###   poisson count, ordered, and categorical
### Aliases: draw_discrete draw_binomial draw_categorical draw_ordered
###   draw_count draw_binary draw_likert draw_quantile

### ** Examples


# Drawing binary values (success or failure, treatment assignment)
fabricate(N = 3,
   p = c(0, .5, 1),
   binary = draw_binary(prob = p))

# Drawing binary values with probit link (transforming continuous data
# into a probability range).
fabricate(N = 3,
   x = 10 * rnorm(N),
   binary = draw_binary(latent = x, link = "probit"))

# Repeated trials: `draw_binomial`
fabricate(N = 3,
   p = c(0, .5, 1),
   binomial = draw_binomial(prob = p, trials = 10))

# Ordered data: transforming latent data into observed, ordinal data.
# useful for survey responses.
fabricate(N = 3,
   x = 5 * rnorm(N),
   ordered = draw_ordered(x = x,
                          breaks = c(-Inf, -1, 1, Inf)))

# Providing break labels for latent data.
fabricate(N = 3,
   x = 5 * rnorm(N),
   ordered = draw_ordered(x = x,
                          breaks = c(-Inf, -1, 1, Inf),
                          break_labels = c("Not at all concerned",
                                           "Somewhat concerned",
                                           "Very concerned")))

# Likert data: often used for survey data
fabricate(N = 10,
          support_free_college = draw_likert(x = rnorm(N),
                                             type = 5))

# Count data: useful for rates of occurrences over time.
fabricate(N = 5,
   x = c(0, 5, 25, 50, 100),
   theft_rate = draw_count(mean=x))

# Categorical data: useful for demographic data.
fabricate(N = 6, p1 = runif(N), p2 = runif(N), p3 = runif(N),
          cat = draw_categorical(cbind(p1, p2, p3)))




