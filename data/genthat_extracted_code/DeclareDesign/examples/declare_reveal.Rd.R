library(DeclareDesign)


### Name: declare_reveal
### Title: Declare a reveal outcomes step
### Aliases: declare_reveal reveal_outcomes_handler

### ** Examples


my_population <- declare_population(N = 100, noise = rnorm(N))

my_potential_outcomes <- declare_potential_outcomes(
  Y_Z_0 = noise, Y_Z_1 = noise +
  rnorm(N, mean = 2, sd = 2))

my_assignment <- declare_assignment(m = 50)

my_reveal <- declare_reveal()

design <- my_population +
  my_potential_outcomes +
  my_assignment +
  my_reveal

design

#  Here the + operator results in the same design being
#  created, because it automatically adds a declare_reveal step.

design <- my_population + my_potential_outcomes + my_assignment

# Declaring multiple assignment variables or multiple outcome variables

population   <- declare_population(N = 10)
potentials_1 <- declare_potential_outcomes(Y1 ~ Z)  
potentials_2 <- declare_potential_outcomes(Y2 ~ 1 + 2*Z)  
potentials_3 <- declare_potential_outcomes(Y3 ~ 1 - X*Z, conditions = list(X = 0:1, Z = 0:1))  
assignment_Z <- declare_assignment(assignment_variable = "Z")
assignment_X <- declare_assignment(assignment_variable = "X")
reveal_1     <- declare_reveal(outcome_variables = c("Y1", "Y2"), assignment_variables = "Z")
reveal_2     <- declare_reveal(outcome_variables = "Y3", assignment_variables = c("X", "Z"))

# Note here that the reveal cannot be done in one step, e.g. by using
# declare_reveal(outcome_variables = c("Y1", "Y2", "Y3"),
#   assignment_variables = c("X","Z"))
# The reason is that in each revelation all outcome variables should be a
# function of all assignment variables.

# declare_reveal can also be used to declare outcomes that include attrition

population <- declare_population(N = 100, age = sample(18:95, N, replace = TRUE))

potential_outcomes_Y <- declare_potential_outcomes(Y ~ .25 * Z + .01 * age * Z)

assignment <- declare_assignment(m = 25)

potential_outcomes_attrition <- 
  declare_potential_outcomes(R ~ rbinom(n = N, size = 1, prob = pnorm(Y_Z_0)))

reveal_attrition <- declare_reveal(outcome_variables = "R")
reveal_outcomes <- declare_reveal(outcome_variables = "Y", attrition_variables = "R")

my_design <- population + potential_outcomes_Y + potential_outcomes_attrition + 
  my_assignment + reveal_attrition + reveal_outcomes




