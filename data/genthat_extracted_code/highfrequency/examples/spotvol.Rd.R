library(highfrequency)


### Name: spotvol
### Title: Spot volatility estimation
### Aliases: spotvol

### ** Examples

# Load sample data

data(sample_real5minprices)
data(sample_returns_5min)

# Default method, deterministic periodicity
## Don't show: 
par.def <- par(no.readonly = TRUE)
## End(Don't show)
vol1 <- spotvol(sample_real5minprices)
plot(vol1)
## Don't show: 
par(par.def)
## End(Don't show)
# Compare to stochastic periodicity
## No test: 
init = list(sigma = 0.03, sigma_mu = 0.005, sigma_h = 0.007,
            sigma_k = 0.06, phi = 0.194, rho = 0.986, mu = c(1.87,-0.42),
            delta_c = c(0.25, -0.05, -0.2, 0.13, 0.02), delta_s = c(-1.2,
            0.11, 0.26, -0.03, 0.08))
# next method will take around 110 iterations
vol2 <- spotvol(sample_real5minprices, method = "stochper", init = init)
plot(as.numeric(vol1$spot[1:780]), type="l")
lines(as.numeric(vol2$spot[1:780]), col="red")
legend("topright", c("detper", "stochper"), col = c("black", "red"), lty=1)
## End(No test)

# Various kernel estimates
## No test: 
h1 = bw.nrd0((1:nrow(sample_returns_5min))*(5*60))
vol3 <- spotvol(sample_returns_5min, method = "kernel", h = h1)
vol4 <- spotvol(sample_returns_5min, method = "kernel", est = "quarticity")
vol5 <- spotvol(sample_returns_5min, method = "kernel", est = "cv")
plot(vol3, length = 2880)
lines(as.numeric(t(vol4$spot))[1:2880], col="red")
lines(as.numeric(t(vol5$spot))[1:2880], col="blue")
legend("topright", c("h = simple estimate", "h = quarticity corrected",
       "h = crossvalidated"), col = c("black", "red", "blue"), lty=1)
## End(No test)
## Don't show: 
par(par.def)
## End(Don't show)
# Piecewise constant volatility, using an example from Fried (2012)
## No test: 
simdata <- matrix(sqrt(5/3)*rt(3000, df = 5), ncol = 500, byrow = TRUE)
simdata <- c(1, 1, 1.5, 1.5, 2, 1)*simdata
# the volatility of the simulated now changes at 1000, 2000 and 2500
vol6 <- spotvol(simdata, method = "piecewise", m = 200, n  = 100,
                online = FALSE)
plot(vol6)
## End(No test)

# Compare regular GARCH(1,1) model to eGARCH, both with external regressors
## No test: 
vol7 <- spotvol(sample_returns_5min, method = "garch", model = "sGARCH")
vol8 <- spotvol(sample_returns_5min, method = "garch", model = "eGARCH")
plot(as.numeric(t(vol7$spot)), type = "l")
lines(as.numeric(t(vol8$spot)), col = "red")
legend("topleft", c("GARCH", "eGARCH"), col = c("black", "red"), lty=1)
## End(No test)



