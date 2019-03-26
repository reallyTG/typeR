library(prefmod)


### Name: salad
### Title: Data (ranks): Salad Dressings (Critchlow and Fligner)
### Aliases: salad
### Keywords: datasets

### ** Examples

# Example for object covariates
# fit object covariates:
# salads A - D have varying concentrations of acetic and gluconic acid.
# The four pairs of concentrations are
# A = (.5, 0), B = (.5, 10.0), C = (1.0, 0), and D = (0, 10.0),

conc <- matrix(c(.5, 0,  .5, 10,  1, 0,  0, 10), ncol = 2, byrow = TRUE)
sal  <- patt.design(salad, nitems = 4, resptype = "ranking")
X    <- as.matrix(sal[, 2:5]) 

glm(y ~ X, data = sal, family = poisson)



