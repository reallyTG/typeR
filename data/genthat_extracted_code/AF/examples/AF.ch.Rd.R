library(AF)


### Name: AF.ch
### Title: Attributable fraction function for cohort sampling designs with
###   time-to-event outcomes. NOTE! Deprecated function. Use 'AFcoxph'.
### Aliases: AF.ch

### ** Examples

# Simulate a sample from a cohort sampling design with time-to-event outcome
expit <- function(x) 1 / (1 + exp( - x))
n <- 500
time <- c(seq(from = 0.2, to = 1, by = 0.2))
Z <- rnorm(n = n)
X <- rbinom(n = n, size = 1, prob = expit(Z))
Tim <- rexp(n = n, rate = exp(X + Z))
C <- rexp(n = n, rate = exp(X + Z))
Tobs <- pmin(Tim, C)
D <- as.numeric(Tobs < C)
#Ties created by rounding
Tobs <- round(Tobs, digits = 2)

# Example 1: non clustered data from a cohort sampling design with time-to-event outcomes
data <- data.frame(Tobs, D, X,  Z)

# Estimation of the attributable fraction
AF.ch_est <- AF.ch(formula = Surv(Tobs, D) ~ X + Z + X * Z, data = data,
                   exposure = "X", times = time)
summary(AF.ch_est)

# Example 2: clustered data from a cohort sampling design with time-to-event outcomes
# Duplicate observations in order to create clustered data
id <- rep(1:n, 2)
data <- data.frame(Tobs = c(Tobs, Tobs), D = c(D, D), X = c(X, X), Z = c(Z, Z), id = id)

# Estimation of the attributable fraction
AF.ch_clust <- AF.ch(formula = Surv(Tobs, D) ~ X + Z + X * Z, data = data,
                         exposure = "X", times = time, clusterid = "id")
summary(AF.ch_clust)
plot(AF.ch_clust, CI = TRUE)



