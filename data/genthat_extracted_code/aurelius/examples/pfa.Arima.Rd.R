library(aurelius)


### Name: pfa.Arima
### Title: PFA Formatting of ARIMA Models
### Aliases: pfa.Arima

### ** Examples

model <- forecast::Arima(USAccDeaths, order=c(2,2,2), seasonal=c(0,2,2))
model_as_pfa <- pfa(model)

# with regressors
n <- 100
ext_dat <- data.frame(x1=rnorm(n), x2=rnorm(n))
x <- stats::arima.sim(n=n, model=list(ar=0.4)) + 2 + 0.8*ext_dat[,1] + 1.5*ext_dat[,2]
model <- stats::arima(x, order=c(1,0,0), xreg = ext_dat)
model_as_pfa <- pfa(model)



