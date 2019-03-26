library(crfsuite)


### Name: crf_options
### Title: Conditional Random Fields parameters
### Aliases: crf_options

### ** Examples

# L-BFGS with L1/L2 regularization
opts <- crf_options("lbfgs")
str(opts)

# SGD with L2-regularization
crf_options("l2sgd")

# Averaged Perceptron
crf_options("averaged-perceptron")

# Passive Aggressive
crf_options("passive-aggressive")

# Adaptive Regularization of Weights (AROW)
crf_options("arow")



