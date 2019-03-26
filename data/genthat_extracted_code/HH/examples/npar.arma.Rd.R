library(HH)


### Name: npar.arma
### Title: Count the number of parameters in an ARIMA model specification.
### Aliases: npar.arma npar.rarma npar.sarma
### Keywords: ts

### ** Examples

co2.arima <-
  if.R(s=
       arima.mle(co2, list(list(order=c(0,1,1)),
                           list(order=c(0,1,1), period=12)))
       ,r=
       arima(co2, 
             order=c(0,1,1),
             seasonal=list(order=c(0,1,1), period=12))
       )

npar.arma(co2.arima)

npar.arma(co2.arima, arima=TRUE)

npar.sarma(list(list(order=c(0,1,1)),
                list(order=c(0,1,1), period=12)))

npar.sarma(list(list(order=c(0,1,1)),
                list(order=c(0,1,1), period=12)),
           arima=TRUE)

if.R(s={},
     r=npar.rarma(co2.arima$arma)
)
if.R(s={},
     r=npar.rarma(co2.arima$arma,
           arima=TRUE)
)




