library(EMMAgeo)


### Name: test.parameters
### Title: Function to evaluate influence of model parameters.
### Aliases: test.parameters
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## truncate the data set for faster computation
X.trunc <- X[1:20,]

## define test parameters
q <- 2:8 # number of end-members
l <- seq(from = 0, to = 0.3, by = 0.1)

## test parameter influence and plot mean total explained variance
TP <- test.parameters(X = X.trunc, q = q, l = l, plot = "mRt",
                      legend = "bottomright", cex = 0.7,
                      multicore = FALSE,
                      colour = rgb((1:7) / 7, 0.9, 0.2, 1))

## show maximum number of end-members
TP$q.max



