library(DeclareDesign)


### Name: diagnosand_handler
### Title: Declare diagnosands
### Aliases: diagnosand_handler declare_diagnosands

### ** Examples


my_population <- declare_population(N = 500, noise = rnorm(N))

my_potential_outcomes <- declare_potential_outcomes(
  Y_Z_0 = noise, Y_Z_1 = noise +
  rnorm(N, mean = 2, sd = 2))

my_assignment <- declare_assignment()

my_estimand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))

my_estimator <- declare_estimator(Y ~ Z, estimand = my_estimand)

my_reveal <- declare_reveal()

design <- my_population + my_potential_outcomes + my_estimand +
        my_assignment + my_reveal + my_estimator

## Not run: 
##D # using built-in defaults:
##D diagnosis <- diagnose_design(design)
##D diagnosis
## End(Not run)

# You can select a set of those diagnosands via the \code{select} argument e.g.,

my_diagnosands <- declare_diagnosands(select = c(bias, rmse))

# Alternatively, you can report all of the default diagnosands and subtract a subset of them e.g.,

my_diagnosands <- declare_diagnosands(subtract = type_s_rate)

# You can add your own diagnosands in addition to or instead of the defaults e.g.,

my_diagnosands <-
  declare_diagnosands(median_bias = median(estimate - estimand))

# or to report only \code{median_bias}

my_diagnosands <-
   declare_diagnosands(median_bias = median(estimate - estimand),
                       keep_defaults = FALSE)

# Below is the code that makes the default diagnosands.
# You can use these as a model when writing your own diagnosands.

default_diagnosands <- declare_diagnosands(
bias = mean(estimate - estimand),
rmse = sqrt(mean((estimate - estimand) ^ 2)),
power = mean(p.value < alpha),
coverage = mean(estimand <= conf.high & estimand >= conf.low),
mean_estimate = mean(estimate),
sd_estimate = sd(estimate),
mean_se = mean(std.error),
type_s_rate = mean((sign(estimate) != sign(estimand))[p.value < alpha]),
mean_estimand = mean(estimand)
)




