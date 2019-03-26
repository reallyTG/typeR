library(sklarsomega)


### Name: simulate.sklarsomega
### Title: Simulate a Sklar's Omega dataset(s).
### Aliases: simulate.sklarsomega

### ** Examples

# The following data were presented in Krippendorff (2013).

data = matrix(c(1,2,3,3,2,1,4,1,2,NA,NA,NA,
                1,2,3,3,2,2,4,1,2,5,NA,3,
                NA,3,3,3,2,3,4,2,2,5,1,NA,
                1,2,3,3,2,4,4,1,2,5,1,NA), 12, 4)
colnames(data) = c("c.1.1", "c.2.1", "c.3.1", "c.4.1")
fit = sklars.omega(data, level = "nominal", confint = "none")
summary(fit)

# Simulate three datasets from the fitted model, and then
# display the first dataset in matrix form.

sim = simulate(fit, nsim = 3, seed = 42)
data.sim = t(fit$data)
data.sim[! is.na(data.sim)] = sim[, 1]
data.sim = t(data.sim)
data.sim



