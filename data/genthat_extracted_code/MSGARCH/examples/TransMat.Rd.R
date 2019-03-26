library(MSGARCH)


### Name: TransMat
### Title: Transition matrix.
### Aliases: TransMat TransMat.MSGARCH_SPEC TransMat.MSGARCH_ML_FIT

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data by ML
fit <- FitML(spec = spec, data = SMI)

# Extract the transition matrix 10 steps ahead
trans.mat <- TransMat(fit, nahead = 10)
print(trans.mat)



