library(MSGARCH)


### Name: PredPdf
### Title: Predictive density.
### Aliases: PredPdf PredPdf.MSGARCH_SPEC PredPdf.MSGARCH_ML_FIT
###   PredPdf.MSGARCH_MCMC_FIT

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data by ML
fit <- FitML(spec = spec, data = SMI)

# run PredPdf method in-sample
pred.its <- PredPdf(object = fit, log = TRUE, do.its = TRUE)

# create a mesh
x <- seq(-3,3,0.01)

# run PredPdf method on mesh at T + 1
pred.x <- PredPdf(object = fit, x = x, log = TRUE, do.its = FALSE)



