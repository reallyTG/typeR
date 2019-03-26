library(CausalImpact)


### Name: CausalImpact
### Title: Inferring causal impact using structural time-series models
### Aliases: CausalImpact

### ** Examples

# Example 1
#
# Example analysis on a simple artificial dataset
# consisting of a response variable y and a
# single covariate x1.
set.seed(1)
x1 <- 100 + arima.sim(model = list(ar = 0.999), n = 52)
y <- 1.2 * x1 + rnorm(52)
y[41:52] <- y[41:52] + 10
data <- cbind(y, x1)
pre.period <- c(1, 40)
post.period <- c(41, 52)
impact <- CausalImpact(data, pre.period, post.period)

# Print and plot results
summary(impact)
summary(impact, "report")
plot(impact)
plot(impact, "original")
plot(impact$model$bsts.model, "coefficients")

# For further output, type:
names(impact)

## Not run: 
##D # Example 2
##D #
##D # Weekly time series: same data as in example 1, annotated
##D # with dates.
##D times <- seq.Date(as.Date("2016-01-03"), by = 7, length.out = 52)
##D data <- zoo(cbind(y, x1), times)
##D 
##D impact <- CausalImpact(data, times[pre.period], times[post.period])
##D 
##D summary(impact)  # Same as in example 1.
##D plot(impact)  # The plot now shows dates on the x-axis.
##D 
##D # Example 3
##D #
##D # For full flexibility, specify a custom model and pass the
##D # fitted model to CausalImpact(). To run this example, run
##D # the code for Example 1 first.
##D post.period.response <- y[post.period[1] : post.period[2]]
##D y[post.period[1] : post.period[2]] <- NA
##D ss <- AddLocalLevel(list(), y)
##D bsts.model <- bsts(y ~ x1, ss, niter = 1000)
##D impact <- CausalImpact(bsts.model = bsts.model,
##D                        post.period.response = post.period.response)
##D plot(impact)
## End(Not run)



