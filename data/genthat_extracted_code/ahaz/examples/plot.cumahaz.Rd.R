library(ahaz)


### Name: plot.cumahaz
### Title: Plot a cumahaz object
### Aliases: plot.cumahaz
### Keywords: hplot

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,15:24])

# Fit additive hazards regression model
fit <- ahaz(surv, X)

# Cumulative hazard
cumhaz <- predict(fit, type="cumhaz")
plot(cumhaz)



