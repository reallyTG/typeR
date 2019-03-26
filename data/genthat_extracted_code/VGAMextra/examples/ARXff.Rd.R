library(VGAMextra)


### Name: ARXff
### Title: VGLTSMs family functions: Order-p Autoregressive Model with
###   covariates
### Aliases: ARXff AR1

### ** Examples

set.seed(1)
nn     <- 150
tsdata <- data.frame(x2 =  runif(nn))             # A single covariate.
theta1 <- 0.45; theta2 <- 0.31; theta3 <- 0.10     # Coefficients
drift  <- c(1.3, -1.1)                             # Two responses.
sdAR   <- c(sqrt(4.5), sqrt(6.0))                  # Two responses.

# Generate AR sequences of order 2 and 3, under Gaussian noise.
# Note, the drift for 'TS2' depends on x2 !
tsdata  <-  data.frame(tsdata, TS1 = arima.sim(nn, 
              model = list(ar = c(theta1, theta1^2)),  rand.gen = rnorm, 
              mean = drift[1], sd = sdAR[1]),
                                TS2 = arima.sim(nn,  
              model = list(ar = c(theta1, theta2, theta3)), rand.gen = rnorm, 
              mean = drift[2] + tsdata$x2 , sd = sdAR[2]))

# EXAMPLE 1. A simple AR(2), maximizing the exact log-likelihood
# Note that parameter constraints are involved for TS1, but not 
# considered in this fit. "rhobit" is used as link for AR coeffs.

fit.Ex1 <- vglm(TS1 ~ 1, ARXff(order = 2, type.EIM = "exact",
                      #iARcoeff = c(0.3, 0.3, 0.3), # OPTIONAL INITIAL VALUES
                      # idrift = 1, ivar = 1.5, isd = sqrt(1.5),
                      lARcoeff = "rhobit"), 
              data = tsdata,  trace = TRUE, crit = "loglikelihood")
Coef(fit.Ex1)
summary(fit.Ex1)
vcov(fit.Ex1, untransform = TRUE)       # Conformable with this fit.
AIC(fit.Ex1)
#------------------------------------------------------------------------#
# Fitting same model using arima(). 
#------------------------------------------------------------------------#
(fitArima <- arima(tsdata$TS1, order = c(2, 0, 0)))
# Compare with 'fit.AR'. True are theta1 = 0.45; theta1^2 = 0.2025
Coef(fit.Ex1)[c(3, 4, 2)]    # Coefficients estimated in 'fit.AR'


# EXAMPLE 2. An AR(3) over TS2, with one covariate affecting the drift only.
# This analysis makes sense as the TS2's drift is a function ox 'x2', 
# i.e., 'x2' affects the 'drift' parameter only. The noise variance 
# (var.arg = TRUE) is estimated, as intercept-only. See the 'zero' argument.

#------------------------------------------------------------------------#
# This model CANNOT be fitted using arima()
#------------------------------------------------------------------------#
fit.Ex2 <- vglm(TS2 ~ x2,  ARXff(order = 3, zero = c("noiseVar", "ARcoeff"), 
                             var.arg = TRUE), 
                  ## constraints = cm.ARMA(Model = ~ 1, lags.cm = 3, Resp = 1),
              data = tsdata,  trace = TRUE, crit = "log")

# True are theta1 <- 0.45; theta2 <- 0.31; theta3 <- 0.10
coef(fit.Ex2, matrix = TRUE)
summary(fit.Ex2)    
vcov(fit.Ex2)
BIC(fit.Ex2)
constraints(fit.Ex2)


# EXAMPLE 3. Fitting an ARX(3) on two responses TS1, TS2; intercept-only model with
#  constraints over the drifts. Here, 
# a) No checks on invertibility performed given the use of cm.ARMA().
# b) Only the drifts are modeled in terms of 'x2'. Then,  'zero' is
# set correspondingly.
#------------------------------------------------------------------------#
# arima() does not handle this model.
#------------------------------------------------------------------------#
fit.Ex3 <- vglm(cbind(TS1, TS2) ~ x2, ARXff(order = c(3, 3), 
                            zero = c("noiseVar", "ARcoeff"), var.arg = TRUE), 
             constraints = cm.ARMA(Model = ~ 1 + x2, lags.cm = c(3, 3), Resp = 2),
             trace = TRUE, data = tsdata, crit = "log")

coef(fit.Ex3, matrix = TRUE)
summary(fit.Ex3)
vcov(fit.Ex3)
constraints(fit.Ex3)






