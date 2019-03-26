## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold', fig.width = 6, fig.cap = 'Time series of one-quarter ahead Greenbook forecasts (crosses) and respective observations (solid line) of real GDP growth in the US.'----
  
library(PointFore)
library(ggplot2)


ggplot(GDP)+
  geom_line(aes(x=date,y=observation))+
  geom_point(aes(x=date,y=forecast), color = 'red', size = 2, shape=4)
  

## ---- fig.show='hold', fig.width = 6, fig.cap = 'Time series of difference between the two considered forecasts.'----
  
ggplot(GDP)+
  geom_line(aes(x=date,y=forecast-forecast_late), color = 'red',alpha=.5)+
  geom_point(aes(x=date,y=forecast-forecast_late), color = 'red', size = .5, shape=4)+
  ylim(-10,10)
  

## ---- fig.show='hold', fig.cap = 'Constant quantile analysis for the main forecast.'----

res <- estimate.functional(model = constant,
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)

## ---- fig.show='hold', fig.cap = 'Constant quantile analysis for the main forecast.'----

res <- estimate.functional(model = constant,
                           instruments = c("lag(lag(Y))","X"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)

## ---- fig.show='hold', fig.cap = 'Constant quantile analysis for the late forecast.'----

res <- estimate.functional(model = constant,
                           state = GDP$forecast_late, Y=GDP$observation,X=GDP$forecast_late)
summary(res)

car::linearHypothesis(res$gmm,"Theta[1]=.5")


## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit) link that depends on the current forecast.'----

res <- estimate.functional(model = probit_linear,
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit link) that depends on the current forecast with instruments $w_t=(1, Y_{t-1}, Y_{t-2})$.'----

res <- estimate.functional(model = probit_linear, instruments = c("lag(Y)","lag(lag(Y))"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit link) that depends on the current forecast with instruments $w_t=(1, X_t, X_{t-1})$.'----

res <- estimate.functional(model = probit_linear, 
                           instruments = c( "X", "lag(X)"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit link) that depends on the current forecast with instruments $w_t=(1, X_t, Y_{t-2})$.'----

res <- estimate.functional(model = probit_linear, 
                           instruments = c( "X", "lag(lag(Y))"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit link) that depends on the current forecast with instruments $w_t=(1, X_t, X_{t-1} - Y_{t-1}, (X_{t-1} - Y_{t-1})^2, X_{t-1}, X_{t-2} - Y_{t-2}, (X_{t-2} - Y_{t-2})^2$.'----

res <- estimate.functional(model = probit_linear, 
                           instruments = c( "X", "lag(X-Y)", "lag(X-Y)^2", 
                                            "lag(X)", "lag(lag(X-Y))", "lag(lag(X-Y))^2"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a quadratic and a cubic spline model (with probit link) that depends on the current forecast.'----

res_quadratic <- estimate.functional(model = probit_spline2,  
                           instruments = c( "X", "lag(X-Y)", "lag(X-Y)^2", 
                                            "lag(X)", "lag(lag(X-Y))", "lag(lag(X-Y))^2"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res_quadratic)

res_cubic <- estimate.functional(model = probit_spline3,  
                           instruments = c( "X", "lag(X-Y)", "lag(X-Y)^2", 
                                            "lag(X)", "lag(lag(X-Y))", "lag(lag(X-Y))^2"),
                           state = GDP$forecast, Y=GDP$observation,X=GDP$forecast)
summary(res_cubic)


plot(res_quadratic,hline = TRUE)
plot(res_cubic,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'State-dependent quantile analysis with a linear model (with probit) link that depends on the lagged observation.'----

res <- estimate.functional(model = probit_linear,
                           state = lag(GDP$observation), Y=GDP$observation,X=GDP$forecast)
summary(res)
#plot(res,hline = TRUE)

