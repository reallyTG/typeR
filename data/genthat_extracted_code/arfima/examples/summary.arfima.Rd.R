library(arfima)


### Name: summary.arfima
### Title: Extensive Summary of an Object
### Aliases: summary.arfima
### Keywords: ts

### ** Examples


## No test: 
data(tmpyr)

fit <- arfima(tmpyr, order = c(1, 0, 1), back=TRUE)
fit

summary(fit)
## End(No test)




