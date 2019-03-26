library(AF)


### Name: AFcoxph
### Title: Attributable fraction function based on a Cox Proportional
###   Hazard regression model as a 'coxph' object (commonly used for cohort
###   sampling designs with time-to-event outcomes).
### Aliases: AFcoxph

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

# Fit a Cox PH regression model
fit <- coxph(formula = Surv(Tobs, D) ~ X + Z + X * Z, data = data, ties="breslow")

# Estimate the attributable fraction from the fitted Cox PH regression model
AFcoxph_est <- AFcoxph(fit, data=data, exposure ="X", times = time)
summary(AFcoxph_est)

# Example 2: clustered data from a cohort sampling design with time-to-event outcomes
# Duplicate observations in order to create clustered data
id <- rep(1:n, 2)
data <- data.frame(Tobs = c(Tobs, Tobs), D = c(D, D), X = c(X, X), Z = c(Z, Z), id = id)

# Fit a Cox PH regression model
fit <- coxph(formula = Surv(Tobs, D) ~ X + Z + X * Z, data = data, ties="breslow")

# Estimate the attributable fraction from the fitted Cox PH regression model
AFcoxph_clust <- AFcoxph(object = fit, data = data,
                         exposure = "X", times = time, clusterid = "id")
summary(AFcoxph_clust)
plot(AFcoxph_clust, CI = TRUE)

# Estimate the attributable fraction from the fitted Cox PH regression model, time unspecified
AFcoxph_clust_no_time <- AFcoxph(object = fit, data = data,
                         exposure = "X", clusterid = "id")
summary(AFcoxph_clust_no_time)
plot(AFcoxph_clust, CI = TRUE)



