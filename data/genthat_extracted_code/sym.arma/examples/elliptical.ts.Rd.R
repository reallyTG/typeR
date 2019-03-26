library(sym.arma)


### Name: elliptical.ts
### Title: Autoregressive and Moving Average Symmetric Models
### Aliases: elliptical.ts

### ** Examples

data(assets)
attach(assets)

# Return in the prices on Microsoft and SP500 index

N = length(msf)
.sp500 = ((sp500[2:N]-sp500[1:(N-1)])/sp500[1:(N-1)])*100
.msf = ((msf[2:N]-msf[1:(N-1)])/msf[1:(N-1)])*100

# The T-bill rates were divided by 253 to convert to a daily rate

.tbill = tbill/253

# Excess return in the prices on Microsoft and SP500 index

Y = .msf - .tbill[1:(N-1)]
X = .sp500 - .tbill[1:(N-1)]

# Period from April 4, 2002 to October 4, 2002

serie = Y[2122:2240]
aux = cbind(X[2122:2240])

# Returns best ARIMA model according to either AIC value.
# auto.arima(Y,xreg=aux,seasonal=FALSE,ic=c("aic"))

# Fit SYMARMA models

fit.1 = elliptical.ts(serie,order=c(0,0,1),xreg=aux,include.mean=FALSE,
 family="Normal")
fit.2 = elliptical.ts(serie,order=c(0,0,1),xreg=aux,include.mean=FALSE,
 family="Student", index1=4)
fit.3 = elliptical.ts(serie,order=c(3,0,1),xreg=aux,family="ExpPower",
 index1=0, fixed=c(0,0,NA,NA,NA,NA))



