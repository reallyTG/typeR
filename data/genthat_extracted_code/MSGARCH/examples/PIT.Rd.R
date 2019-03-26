library(MSGARCH)


### Name: PIT
### Title: Probability integral transform.
### Aliases: PIT PIT.MSGARCH_SPEC PIT.MSGARCH_ML_FIT PIT.MSGARCH_MCMC_FIT

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data by ML
fit <- FitML(spec = spec, data = SMI)

# run PIT method in-sample
pit.its <- PIT(object = fit, do.norm = TRUE, do.its = TRUE)

# diagnostic of PIT with qqnorm
qqnorm(pit.its)
qqline(pit.its)

# simulate a serie from the model
set.seed(123)
sim.series <- simulate(object = spec, par = fit$par, nahead= 1000L, nsim = 1L)
sim.series <- as.vector(sim.series$draw)

# run PIT method on the simualed serie with the true par
pit.x <- PIT(object = spec, par = fit$par, data = sim.series, do.norm = TRUE, do.its = TRUE)
qqnorm(pit.x)
qqline(pit.x)



