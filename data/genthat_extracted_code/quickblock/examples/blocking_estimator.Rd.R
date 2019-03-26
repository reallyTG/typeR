library(quickblock)


### Name: blocking_estimator
### Title: Estimator for treatment effects in blocked experiments
### Aliases: blocking_estimator

### ** Examples

# Example blocking
my_blocking <- qb_blocking(c("A", "A", "B", "C", "B",
                             "C", "B", "C", "B", "A",
                             "C", "C", "A", "B", "B",
                             "B", "B", "A", "A", "C"))

# Two treatment conditions
my_treatments <- assign_treatment(my_blocking)
my_outcomes <- rnorm(20)
blocking_estimator(my_outcomes, my_blocking, my_treatments)

# Three treatment conditions
my_treatments <- assign_treatment(my_blocking, c("T1", "T2", "C"))
my_outcomes <- rnorm(20)
blocking_estimator(my_outcomes, my_blocking, my_treatments)

# Four treatment conditions
# (This will throw an error because variances cannot be estimated)
my_treatments <- assign_treatment(my_blocking, c("T1", "T2", "T3", "C"))
my_outcomes <- rnorm(20)
## Not run: blocking_estimator(my_outcomes, my_blocking, my_treatments)




