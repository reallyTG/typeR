library(jrt)


### Name: info.plot
### Title: Plot the information function for a judge or for the entire set
###   of judges.
### Aliases: info.plot

### ** Examples


# Simulate data with package mirt
# (6 judges, 300 productions, ordinal ratings from 1 to 5)
set.seed(123)
N <- 300
judges <- 6
diffs <- t(apply(matrix(runif(judges*4, .4, 5), judges), 1, cumsum))
d <- -(diffs - rowMeans(diffs)) + stats::rnorm(judges, mean = 0, sd= 1)
data <- mirt::simdata(matrix(rlnorm(judges,1,0)), d, N,
itemtype = 'graded') + 1
colnames(data) <- paste("Judge_", 1:dim(data)[2], sep = "")
data <- as.data.frame(data)
### --> See mirt documentation for details

# Fit model
fit <- jrt(data, irt.model = "PCM")

# Information function of the first judge
info.plot(fit, 1)

# Reliability function of the second judge
info.plot(fit, 2, type = "reliability")

# Standard error function of the entire set of judges
info.plot(fit, "all", type = "SE")

# See vignette for more options




