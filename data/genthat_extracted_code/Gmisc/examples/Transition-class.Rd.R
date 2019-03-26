library(Gmisc)


### Name: Transition-class
### Title: A reference class for generating transition plots
### Aliases: Transition-class Transition

### ** Examples

# Transitions
set.seed(1)
n <- 10
my_data <-
  data.frame(
    Var_a = sample(c("Test 1",
                     "Test 2",
                     "Test 3"),
                   size = n,
                   replace = TRUE,
                   prob = 3:1),
    Var_b = sample(c("Test 1",
                     "Test 2",
                     "Test 3"),
                   size = n,
                   replace = TRUE,
                   prob = 1:3))
mtrx <- with(my_data,
             table(Var_a, Var_b))

# Initialize the transition plot
transitions <-
  getRefClass("Transition")$new(mtrx, label=c("Before", "After"))

# Render the plot
transitions$render()



