library(sns)


### Name: sns.make.part
### Title: Utility Functions for Creating and Validating State Space
###   Partitions
### Aliases: sns.make.part sns.check.part

### ** Examples

# creating a valid partition of a 6-dimensional state space
my.part.valid <- list(c(1,2,3), c(4,5,6))
is.valid.1 <- sns.check.part(my.part.valid, 6)
cat("is partition valid: ", is.valid.1, "\n")

# creating an invalid partition of a 6-dimensional state space
# (coordinate 4 is missing)
my.part.invalid <- list(c(1,2,3), c(5,6))
is.valid.2 <- sns.check.part(my.part.invalid, 6)
cat("is partition valid: ", is.valid.2, "\n")




