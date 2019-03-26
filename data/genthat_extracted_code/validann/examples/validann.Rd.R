library(validann)


### Name: validann
### Title: Validate Artificial Neural Networks.
### Aliases: validann validann.ann validann.default validann.nnet

### ** Examples

# get validation results for 1-hidden node `ann' model fitted to ar9 data
# based on training data.
# ---
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)
results <- validann(fit, x = x)

# get validation results for above model based on a new sample of ar9 data.
# ---
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

obs <- y
sim <- predict(fit, newdata = x)
results <- validann(fit, obs = obs, sim = sim, x = x)

# get validation results for `obs' and `sim' data without ANN model.
# In this example `sim' is generated using a linear model. No structural
# validation of the model is possible, but `wts' are provided to compute the
# number of model parameters needed for the calculation of certain
# goodness-of-fit metrics.
# ---
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- as.matrix(x[, c(1,4,9)])
lmfit <- lm.fit(x, y)
sim <- lmfit$fitted.values
obs <- y
results <- validann(obs = obs, sim = sim, wts = lmfit$coefficients)

# validann would be called in the same way if the ANN model used to generate
# `sim' was not available or was not of class `ann' or `nnet'. Ideally in
# this case, however, both `wts' and `nodes' should be supplied such that
# some structural validation metrics may be computed.
# ---
obs <- c(0.257, -0.891, -1.710, -0.575, -1.668, 0.851, -0.350, -1.313,
         -2.469, 0.486)
sim <- c(-1.463, 0.027, -2.053, -1.091, -1.602, 2.018, 0.723, -0.776,
         -2.351, 1.054)
wts <- c(-0.05217, 0.08363, 0.07840, -0.00753, -7.35675, -0.00066)
nodes <- c(3, 1, 1)
results <- validann(obs = obs, sim = sim, wts = wts, nodes = nodes)




