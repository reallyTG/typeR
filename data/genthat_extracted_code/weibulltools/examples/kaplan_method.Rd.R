library(weibulltools)


### Name: kaplan_method
### Title: Estimation of Failure Probabilities using Kaplan-Meier
### Aliases: kaplan_method

### ** Examples

# Example 1
obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
uic   <- c("3435", "1203", "958X", "XX71", "abcd", "tz46",
           "fl29", "AX23","Uy12", "kl1a")

df_kap <- kaplan_method(x = obs, event = state, id = uic)

# Example 2
 df <- data.frame(obs = c(10000, 10000, 20000, 20000, 30000,
                         30000, 30000, 30000, 40000, 50000,
                         50000, 60000, 70000, 70000, 70000,
                         70000, 80000, 80000, 80000, 80000,
                         90000, 90000, 100000),
                 state = rep(1, 23))

df_kap2 <- kaplan_method(x = df$obs, event = df$state)



