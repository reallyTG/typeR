library(jrt)


### Name: jrt
### Title: Fit ordinal IRT models on judgment data and return factor scores
###   and statistics.
### Aliases: jrt

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

# Fit models
fit <- jrt(data,
  irt.model = "GRM", # to manually select a model
  plots = FALSE) # to remove plots

# Extract the factor scores
fit@factor.scores # In a dataframe with standard errors
fit@factor.scores.vector # As a numeric vector

# See vignette for more options




