library(DeclareDesign)


### Name: declare_estimator
### Title: Declare estimator
### Aliases: declare_estimator declare_estimators tidy_estimator
###   model_handler estimator_handler

### ** Examples


# Declare estimand
my_estimand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))

# Declare estimator using the default handler using `difference_in_means`
# estimator from `estimatr` package. Returns the first non-intercept term
# as estimate

my_estimator_dim <- declare_estimator(Y ~ Z, estimand = "ATE", label = "DIM")

# Use lm function from base R
my_estimator_lm <- declare_estimator(Y ~ Z, estimand = "ATE",
  model = lm, label = "LM")
# Use lm_robust (linear regression with robust standard errors) from
# `estimatr` package

my_estimator_lm_rob <- declare_estimator(
  Y ~ Z,
  estimand = "ATE",
  model = lm_robust,
  label = "LM_Robust"
)

# Set `term` if estimate of interest is not the first non-intercept variable
my_estimator_lm_rob_x <- declare_estimator(
  Y ~ X + Z,
  estimand = my_estimand,
  term = "Z",
  model = lm_robust
)

# Use glm from base R
my_estimator_glm <- declare_estimator(
  Y ~ X + Z,
  family = "gaussian",
  estimand = my_estimand,
  term = "Z",
  model = glm
)

# A probit
estimator_probit <- declare_estimator(
  Y ~ Z,
  model = glm,
  family = binomial(link = "probit"),
  term = "Z"
)

# Declare estimator using a custom handler

# Define your own estimator and use the `tidy_estimator` function for labeling
# Must have `data` argument that is a data.frame
my_estimator_function <- function(data){
  data.frame(estimate = with(data, mean(Y)))
}

my_estimator_custom <- declare_estimator(
  handler = tidy_estimator(my_estimator_function),
  estimand = my_estimand
)

# Customize labeling

my_estimator_function <- function(data){
  data.frame(
    estimator_label = "foo",
    estimand_label = "bar",
    estimate = with(data, mean(Y)),
    n = nrow(data),
    stringsAsFactors = FALSE
  )
}

my_estimator_custom2 <- declare_estimator(handler = my_estimator_function)


# Examples

# First, set up the rest of a design
set.seed(42)

design_def <-
  declare_population(N = 100, X = rnorm(N), W = rexp(N, 1), noise = rnorm(N)) +
  declare_potential_outcomes(Y ~ .25 * Z + noise) +
  declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0)) +
  declare_assignment(m = 50) +
  declare_reveal() +
  my_estimator_dim

draw_estimates(design_def)

# Can also use declared estimator on a data.frame
dat <- draw_data(design_def)
my_estimator_dim(dat)

# ----------
# 2. Using existing estimators
# ----------

design <- replace_step(design_def, my_estimator_dim, my_estimator_lm_rob)
draw_estimates(design)

design <- replace_step(design_def, my_estimator_dim, my_estimator_lm)
draw_estimates(design)

design <- replace_step(design_def, my_estimator_dim, my_estimator_glm)
draw_estimates(design)

# ----------
# 3. Using custom estimators
# ----------

design <- replace_step(design_def, my_estimator_dim, my_estimator_custom)

draw_estimates(design)

# The names in your custom estimator return should match with
# your diagnosands when diagnosing a design
my_median <- function(data) data.frame(med = median(data$Y))

my_estimator_median <- declare_estimator(
  handler = tidy_estimator(my_median),
  estimand = my_estimand
)

design <- replace_step(design_def, my_estimator_dim, my_estimator_median)

draw_estimates(design)

my_diagnosand <- declare_diagnosands(med_to_estimand = mean(med - estimand),
  keep_defaults = FALSE)

## Not run: 
##D diagnose_design(design, diagnosands = my_diagnosand, sims = 5,
##D   bootstrap_sims = FALSE)
## End(Not run)

# ----------
# 4. Multiple estimators per estimand
# ----------

design_two <- insert_step(design_def,  my_estimator_lm,
  after = my_estimator_dim)

draw_estimates(design_two)

## Not run: 
##D diagnose_design(design_two, sims = 5, bootstrap_sims = FALSE)
## End(Not run)



