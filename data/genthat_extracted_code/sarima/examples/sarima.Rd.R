library(sarima)


### Name: sarima
### Title: Fit extended SARIMA models
### Aliases: sarima
### Keywords: ts arima

### ** Examples

## AirPassengers example
## fit the classic airline model using arima()
ap.arima <- arima(log(AirPassengers), order = c(0,1,1), seasonal = c(0,1,1))

## samemodel using twoequivalent ways to specify it
ap.baseA <- sarima(log(AirPassengers) ~ 
                   0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(1) + si(12,1), 
                   ss.method = "base")
ap.baseB <- sarima(log(AirPassengers) ~ 
                   0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(12), 
                   ss.method = "base")

ap.baseA
summary(ap.baseA)
ap.baseB
summary(ap.baseB)

## as above, but drop 1-B from the model:
ap2.arima <- arima(log(AirPassengers), order = c(0,0,1), seasonal = c(0,1,1))
ap2.baseA <- sarima(log(AirPassengers) ~ 
                    0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) +     si(12,1), 
                    ss.method = "base")
ap2.baseB <- sarima(log(AirPassengers) ~ 
                    0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(1) + s(12), 
                    ss.method = "base")

## for illustration, here the non-stationary part is 
##     (1-B)^2(1+B+...+B^5) = (1-B)(1-B^6)
##     (  compare to (1-B)(1-B^{12}) = (1-B)(1-B^6)(1+B^6) ) 
ap3.base <- sarima(log(AirPassengers) ~ 
                   0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(6), 
                   ss.method = "base")

## further unit roots, equivalent specifications for the airline model
tmp.su <- sarima(log(AirPassengers) ~ 
                 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(2) + su(12,1:5), 
                 ss.method = "base")
tmp.su$interna$delta_poly
prod(tmp.su$interna$delta_poly)
zapsmall(coef(prod(tmp.su$interna$delta_poly)))
tmp.su

tmp.u <- sarima(log(AirPassengers) ~ 
                0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(2) + u((1:5)/12), 
                ss.method = "base")
tmp.u



