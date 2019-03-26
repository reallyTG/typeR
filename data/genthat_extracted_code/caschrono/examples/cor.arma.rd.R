library(caschrono)


### Name: cor.arma
### Title: Correlation matrix of the parameters for an Arima model
### Aliases: cor.arma
### Keywords: ts

### ** Examples

set.seed(4123)
n2 <- 210
yc <- arima.sim(n = 200, list(ar = -0.8, ma= c(-0.3, 0.6)),
 sd = sqrt(1.5))                               
yc <- yc - 10
if(require("forecast")){
fit <- Arima(yc, order = c(1, 0, 2))
cor.arma(fit)
}



