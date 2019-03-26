library(cents)


### Name: print.Cenarma
### Title: Plot method for "cents" object
### Aliases: print.Cenarma
### Keywords: ts

### ** Examples

set.seed(321)
n <- 200
z <- arima.sim(model=list(ar=0.8), n) 
i <- sample(1:n, size=floor(0.25*n))
z[i] <- NA
cenarma(y=z, p=1)



