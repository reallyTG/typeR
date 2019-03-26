library(GRCdata)


### Name: find.scheme
### Title: Search for the global optimal grouping scheme of grouped and/or
###   right-censored count data
### Aliases: find.scheme

### ** Examples

# Example 1 ####################################
# M=7, N=3, 0 is not required to be contained
# in a separate group of grouping schemes.
# Poisson model, lambda takes 4 and 5 and each value has a probability of 0.5.
find.scheme(probs = c(0.5, 0.5), lambdas = c(4,5),
  M = 7, N = 3, is.0.isolated = FALSE, model = "Poisson")

# Example 2 ####################################
# N=3, 0 is required to be contained in a separate group of grouping schemes.
# Poisson model, lambda takes 4 and 5 and each value has a probability of 0.5.
# M is not given, so it will be selected automatically.
find.scheme(probs = c(0.5, 0.5), lambdas = c(4,5),
  N = 3, is.0.isolated = TRUE, model = "Poisson")

# Example 3 ####################################
# M=7, N=3, 0 is not required to be contained in a separate group.
# ZIP model, (lambda, p) take (4, 0.3) and (5, 0.4)
# with their probabilities denoted by c(0.5, 0.5)
## No test: 
find.scheme(probs = c(0.5, 0.5), lambdas = c(4,5), ps = c(0.3, 0.5),
  M = 7, N = 3, is.0.isolated = FALSE, model = "ZIP")
## End(No test)

# Example 4 ####################################
# N=3, 0 is not required to be contained in a separate group.
# Poisson model, lambda takes a normal distribution truncated to [1, 10]
# M is not given, so it will be selected automatically.
## No test: 
find.scheme(densityFUN = function(lambda)
  dnorm(lambda, mean = 3, sd = 1),
  lambda.lwr = 1, lambda.upr = 10,
  N = 3, is.0.isolated = FALSE, model = "Poisson")
## End(No test)

# Example 5 ####################################
# M=7, N=3, 0 is required to be contained in a separate group.
# Poisson model, lambda takes a normal distribution truncated to [1, 10]
## No test: 
find.scheme(densityFUN = function(lambda)
  dnorm(lambda, mean = 3, sd = 1),
  lambda.lwr = 1, lambda.upr = 10,
  M = 7, N = 3, is.0.isolated = TRUE, model = "Poisson")
## End(No test)

# Example 6 ####################################
# N=3, 0 is required to be contained in a separate group.
# Poisson model, lambda takes an uniform distribution on [1, 10]
# M is not given, so it will be selected automatically.
find.scheme(densityFUN = function(lambda)
  dunif(lambda, min = 1, max = 10),
  lambda.lwr = 1, lambda.upr = 10,
  N = 3, is.0.isolated = TRUE, model = "Poisson")

# Example 7 #################################
# M=7, N=3, 0 is required to be contained in a separate group.
# ZIP model, (lambda, p) has an uniform distribution with
# lambda on [1,10] and p on [0.1, 0.9]
## No test: 
find.scheme(densityFUN = function(...) 1,
  lambda.lwr = 1, lambda.upr = 10, p.lwr = 0.0001, p.upr = 0.9999,
  M = 7, N = 3, is.0.isolated = TRUE, model = "ZIP")
## End(No test)

# Example 8 ####################################
# M=7, N=3, 0 is required to be contained in a separate group.
# ZIP model, (lambda, p) has a normal distribution centered
# at (5.5, 0.5) with a covariance matrix showing their correlation
#    /                 \
#    |  11/3      3    |
#    |    3     11/3   |
#    \                 /.
# This normal distribution is also truncated to
# [1, 10] X [0.1, 0.9]
# Note: this example may take several minutes to converge,
# depending on your computer configuration.
## No test: 
dsty <- function(lambda, p){
  vec <- c(lambda - 5.5, p - 0.5)
  mat <- matrix(c(11/3,3,3,11/3), nrow = 2, ncol = 2)
  pw <- -0.5 * sum(vec * solve(mat, vec))
  return(exp(pw))
}
find.scheme(densityFUN = dsty,
  lambda.lwr = 1, lambda.upr = 10, p.lwr = 0.1, p.upr = 0.9,
  M = 7, N = 3, is.0.isolated = TRUE, model = "ZIP")
## End(No test)



