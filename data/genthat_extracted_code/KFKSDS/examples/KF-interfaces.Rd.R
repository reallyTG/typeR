library(KFKSDS)


### Name: KF-interfaces
### Title: Kalman Filter
### Aliases: KF-interfaces KalmanFilter make.KF.args
### Keywords: ts, model

### ** Examples

# state space representation of a structural time series model 
# with arbitrary parameter values
require("stsm")
m <- stsm::stsm.model(model = "BSM", y = AirPassengers, transP = "StructTS",
  pars = c("var1" = 30, "var2" = 15, "var3" = 1, "var4" = 12))
ss <- stsm::char2numeric(m)
# value of the likelihood using different interfaces and options
KalmanFilter(y = m@y, ss = ss, KF.version = "KFKSDS", KF.args = list(P0cov = FALSE))$mloglik
KalmanFilter(y = m@y, ss = ss, KF.version = "KFKSDS", KF.args = list(P0cov = TRUE))$mloglik
# 'StructTS' does not include some constants
KalmanFilter(y = m@y, ss = ss, KF.version = "StructTS")$mloglik



