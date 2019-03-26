library(cents)


### Name: boot.Cenarma
### Title: parametric bootstrap for Cenarma object
### Aliases: boot.Cenarma
### Keywords: ts

### ** Examples

set.seed(43137)
n <- 200
z <- arima.sim(model=list(ar=0.8), n) 
i <- sample(1:n, size=floor(0.25*n))
z[i] <- NA
ANS <- cenarma(y=z, p=1)
out <- boot.Cenarma(ANS)
cenarma(out$y, p=1)



