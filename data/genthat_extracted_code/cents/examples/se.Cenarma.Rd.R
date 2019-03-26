library(cents)


### Name: se.Cenarma
### Title: Bootstrap se for Cenarma object
### Aliases: se.Cenarma
### Keywords: ts

### ** Examples

#Example takes about 30 seconds
## Not run: 
##D set.seed(43137)
##D n <- 200
##D z <- arima.sim(model=list(ar=0.8), n) 
##D i <- sample(1:n, size=floor(0.25*n))
##D z[i] <- NA
##D ANS <- cenarma(y=z, p=1)
##D startTime <- proc.time()[3]
##D se.Cenarma(ANS)
##D totalTime <- proc.time()[3]-startTime
##D totalTime
## End(Not run)



