library(weibulltools)


### Name: johnson_method
### Title: Estimation of Failure Probabilities using Johnson's Method
### Aliases: johnson_method

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
uic   <- c("3435", "1203", "958X", "XX71", "abcd", "tz46",
           "fl29", "AX23", "Uy12", "kl1a")

df_john <- johnson_method(x = obs, event = state, id = uic)



