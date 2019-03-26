library(equaltestMI)


### Name: eqMI.ncp
### Title: Obtain noncentrality parameter of a chisquare distribution
### Aliases: eqMI.ncp

### ** Examples

alpha <- .05
n_1 <- 200
n_2 <- 200
N <- n_1 + n_2
m <- 2
# A made-up likelihood-ratio statistic
T_ml <- 8.824
df <- 6
eqMI.ncp(T = T_ml, df = df, N = N, m = m, alpha = alpha)




