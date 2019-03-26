library(weibulltools)


### Name: nelson_method
### Title: Estimation of Failure Probabilities using the Nelson-Aalen
###   Estimator
### Aliases: nelson_method

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
uic   <- c("3435", "1203", "958X", "XX71", "abcd", "tz46",
           "fl29", "AX23","Uy12", "kl1a")

df_nel <- nelson_method(x = obs, event = state, id = uic)




