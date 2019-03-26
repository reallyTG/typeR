library(epiphy)


### Name: smle
### Title: Simple maximum likelihood estimation
### Aliases: smle smle.default smle.intensity
### Keywords: internal

### ** Examples

set.seed(12345)
data <- rlogis(100, location = 5, scale = 2)
ll_logis <- function(data, param = c(location = 0, scale = 1)) {
    sum(dlogis(x = data, location = param[["location"]],
               scale = param[["scale"]], log = TRUE))
}
res <- smle(data, ll_logis)
res
summary(res)

# Using the magrittr syntax:
require(magrittr)
data %>% smle(ll_logis)

# Comparision with the output of fitdistr (MASS package), which works for a
# limited number of predefined distributions:
require(MASS)
fitdistr(data, "logistic")

# Example with an intensity object:
require(magrittr)
require(dplyr)
data <- tomato_tswv$field_1929 %>%
    filter(t == 1) %>%
    incidence() %>%
    clump(unit_size = c(x = 3, y = 3))
ll_betabinom <- function(data, param) {
    sum(dbetabinom(x = data[["i"]], size = data[["n"]],
                   prob = param[["prob"]], theta = param[["theta"]],
                   log = TRUE))
}
epsilon <- 1e-7
res <- smle(data, ll_betabinom, param_init = c(prob = 0.5, theta = 0.5),
            lower = c(prob  = 0 + epsilon,
                      theta = 0 + epsilon),
            upper = c(prob = 1 - epsilon,
                      theta = Inf))
res
summary(res)

param_init <- data.frame(lower = c(0 + epsilon, 0 + epsilon),
                         start = c(0.5, 0.5),
                         upper = c(1 - epsilon, Inf))
rownames(param_init) <- c("prob", "theta")
res <- smle(data, ll_betabinom, param_init)
res
summary(res)




