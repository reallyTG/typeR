library(DeclareDesign)


### Name: declare_potential_outcomes
### Title: Declare potential outcomes
### Aliases: declare_potential_outcomes potential_outcomes.formula
###   potential_outcomes.NULL

### ** Examples


# Declare potential outcomes using default handler

# There are two ways of declaring potential outcomes:

# As separate variables

my_potential_outcomes <- declare_potential_outcomes(
  Y_Z_0 = .05,
  Y_Z_1 = .30 + .01 * age
)

# Using a formula
 my_potential_outcomes <- declare_potential_outcomes(
   Y ~ .05 + .25 * Z + .01 * age * Z)

# `conditions` defines the "range" of the potential outcomes function
 my_potential_outcomes <- declare_potential_outcomes(
   formula = Y ~ .05 + .25 * Z + .01 * age * Z,
   conditions = 1:4
 )

# Multiple assignment variables can be specified in `conditions`. For example,
# in a 2x2 factorial potential outcome:

 my_potential_outcomes <- declare_potential_outcomes(
   formula = Y ~ .05 + .25 * Z1 + .01 * age * Z2,
   conditions = list(Z1 = 0:1, Z2 = 0:1)
 )

# You can also declare potential outcomes using a custom handler

my_po_function <- function(data) {
  data$Y_treated   <- rexp(nrow(data), .2)
  data$Y_untreated <- rexp(nrow(data), .4)
  data
}

custom_potential <- declare_potential_outcomes(handler = my_po_function)




