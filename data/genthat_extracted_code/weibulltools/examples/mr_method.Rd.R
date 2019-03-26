library(weibulltools)


### Name: mr_method
### Title: Estimation of Failure Probabilities using Median Ranks
### Aliases: mr_method

### ** Examples

# Example 1
obs   <- seq(10000, 100000, 10000)
state <- rep(1, length(obs))
uic   <- c("3435", "1203", "958X", "XX71", "abcd", "tz46",
           "fl29", "AX23", "Uy12", "kl1a")

df_mr <- mr_method(x = obs, event = state, id = uic,
                   method = "benard")

# Example 2
df_mr_invbeta <- mr_method(x = obs, event = state, id = uic,
                           method = "invbeta")



