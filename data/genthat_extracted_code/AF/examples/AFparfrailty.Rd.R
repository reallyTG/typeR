library(AF)


### Name: AFparfrailty
### Title: Attributable fraction function based on a Weibull gamma-frailty
###   model as a 'parfrailty' object (commonly used for cohort sampling
###   family designs with time-to-event outcomes).
### Aliases: AFparfrailty

### ** Examples

# Example 1: clustered data with frailty U
expit <- function(x) 1 / (1 + exp( - x))
n <- 100
m <- 2
alpha <- 1.5
eta <- 1
phi <- 0.5
beta <- 1
id <- rep(1:n,each=m)
U <- rep(rgamma(n, shape = 1 / phi, scale = phi), each = m)
Z <- rnorm(n * m)
X <- rbinom(n * m, size = 1, prob = expit(Z))
# Reparametrize scale as in rweibull function
weibull.scale <- alpha / (U * exp(beta * X)) ^ (1 / eta)
t <- rweibull(n * m, shape = eta, scale = weibull.scale)

# Right censoring
c <- runif(n * m, 0, 10)
delta <- as.numeric(t < c)
t <- pmin(t, c)

data <- data.frame(t, delta, X, Z, id)

# Fit a parfrailty object
library(stdReg)
fit <- parfrailty(formula = Surv(t, delta) ~ X + Z + X * Z, data = data, clusterid = "id")
summary(fit)

# Estimate the attributable fraction from the fitted frailty model

time <- c(seq(from = 0.2, to = 1, by = 0.2))

AFparfrailty_est <- AFparfrailty(object = fit, data = data, exposure = "X",
                                  times = time, clusterid = "id")
summary(AFparfrailty_est)
plot(AFparfrailty_est, CI = TRUE, ylim=c(0.1,0.7))



