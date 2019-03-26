library(MSGARCH)


### Name: ExtractStateFit
### Title: Single-regime model extractor.
### Aliases: ExtractStateFit ExtractStateFit.MSGARCH_ML_FIT
###   ExtractStateFit.MSGARCH_MCMC_FIT

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data with ML estimation
fit <- FitML(spec = spec, data = SMI)
SR.fit <- ExtractStateFit(fit)
print(SR.fit)



