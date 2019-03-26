library(lfstat)


### Name: tyears
### Title: Calculate Low-Flow Quantiles for given Return Periods
### Aliases: tyears
### Keywords: low-flow fitting

### ** Examples

data("ngaruroro")
ng <- subset(ngaruroro, hyear %in% 1964:2000)

# vector of return periods
rp <- c(1.5, 5, 10, 100)

# Fitting some distributions for the low flows (annual minima)
# and estimating the quantile for arbitrary return periods
y <- tyears(ng, dist = c("gum", "wei", "ln3", "pe3"), event = rp,
            plot = FALSE)

# print()ing the object shows just the return periods
y

# but y is actually a list
str(y)

# there is a summary method, returning L-moments and estimated parameters
summary(y)

plot(y)


# fitting just one distribution, with annotated quantiles
z <- tyears(ng, dist = c("gevR"), event = rp)
rpline(y, return.period = rp, suffix = c("a", "m\u00B3"))


# applying a moving average before fitting
ng2 <- ng
ng2$flow <- ma(ng2$flow, n = 4)
tyears(ng2, dist = c("gum", "wei", "ln3", "pe3"), event = rp,
       plot = FALSE)



