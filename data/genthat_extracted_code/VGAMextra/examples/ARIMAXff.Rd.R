library(VGAMextra)


### Name: ARIMAXff
### Title: VGLTSMs Family functions: The Order-(p, d, q) Autoregressive
###   Integrated Moving Average Model (ARIMA(p, d, q)) with covariates
### Aliases: ARIMAXff ARMAXff

### ** Examples

set.seed(3)
nn      <- 90
theta   <- c(0.12, 0.17)  # AR coefficients
phi     <- c(-0.15, 0.20)  # MA coefficients.
sdWNN <- exp(1.0)          # SDs
mu    <- c(1.25, 0.85)     # Mean (not drift) of the process.
covX  <- runif(nn + 1)     # A single covariate.
mux3  <- mu[1] + covX
##
## Simulate ARMA processes. Here, the drift for 'tsd3' depends on covX.
##
tsdata <- data.frame(TS1 = mu[1] + arima.sim(model = list(ar = theta, ma = phi,
                             order = c(2, 1, 2)), n = nn, sd = sdWNN ),
                      TS2 = mu[2] + arima.sim(model = list(ar = theta, ma = phi,
                            order = c(2, 1, 2)), n = nn, sd = exp(2 + covX)),
                      TS3 =  mux3 + arima.sim(model = list(ar = theta, ma = phi,
                            order = c(2, 1, 2)), n = nn, sd = exp(2 + covX) ),
                      x2 = covX)

### EXAMPLE 1. Fitting a simple ARIMA(2, 1, 2) using vglm(). 
# Note that no covariates involved. 
fit.ARIMA1 <-  vglm(TS1 ~ 1, ARIMAXff(order = c(2, 1, 2), var.arg = FALSE,
                       # OPTIONAL INITIAL VALUES
                       # idrift = c(1.5)*(1 - sum(theta)), 
                       # ivar = exp(4), isd = exp(2),
                       # iARcoeff = c(0.20, -0.3, 0.1),
                       # iMAcoeff = c(0.25, 0.35, 0.1),
                        type.EIM = "exact"), 
                 data = tsdata, trace = TRUE, crit = "log")
Coef(fit.ARIMA1)
summary(fit.ARIMA1)
vcov(fit.ARIMA1, untransform = TRUE)
#------------------------------------------------------------------------#
# Fitting same model using arima().
#------------------------------------------------------------------------#
# COMPARE to EXAMPLE1 
( fitArima  <- arima(tsdata$TS1, order = c(2, 1, 2)) ) 


### EXAMPLE 2. Here only the ARMA coefficients and drift are intercept-only.
# The random noise variance is not constant.
fit.ARIMA2 <-  vglm(TS2 ~ x2,  ARIMAXff(order = c(2, 1, 2), var.arg = TRUE,
                     lARcoeff = "rhobit", lMAcoeff = "identitylink",
                     type.EIM = c("exact", "approximate")[1], 
                     # NOTE THE ZERO ARGUMENT. 
                     zero = c("drift.mean", "ARcoeff", "MAcoeff")),
              data = tsdata, trace = TRUE)

coef(fit.ARIMA2, matrix = TRUE)
summary(fit.ARIMA2)
constraints(fit.ARIMA2)



### EXAMPLE 3. Here only ARMA coefficients are intercept-only.
# The random noise variance is not constant.
# Note that the "drift" and the "variance" are "generated" in 
# terms of 'x2' above for TS3.

fit.ARIMA3 <- vglm(TS3 ~ x2,  ARIMAXff(order = c(1, 1, 2), var.arg = TRUE,
                     lARcoeff = "identitylink", lMAcoeff = "identitylink",
                     type.EIM = c("exact", "approximate")[1], nodrift = FALSE,
                     zero = c( "ARcoeff", "MAcoeff")), # NOTE THE ZERO ARGUMENT. 
              data = tsdata, trace = TRUE)
              
coef(fit.ARIMA3, matrix = TRUE)
summary(fit.ARIMA3)
constraints(fit.ARIMA3)




