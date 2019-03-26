library(artfima)


### Name: predict.artfima
### Title: Predict method for artfima
### Aliases: predict.artfima
### Keywords: ts

### ** Examples

ans <- artfima(seriesa, likAlg="Whittle")
predict(ans)
#compare forecasts from ARTFIMA etc.
  ## Not run: 
##D ML <- 10
##D ans <- artfima(seriesa)
##D Ftfd <- predict(ans, n.ahead=10)$Forecasts 
##D ans <- artfima(seriesa, glp="ARIMA", arimaOrder=c(1,0,1))
##D Farma11 <- predict(ans, n.ahead=10)$Forecasts 
##D ans <- artfima(seriesa, glp="ARFIMA")
##D Ffd <- predict(ans, n.ahead=10)$Forecasts
##D #arima(0,1,1)
##D ans <- arima(seriesa, order=c(0,1,1))
##D fEWMA <- predict(ans, n.ahead=10)$pred
##D yobs<-seriesa[188:197]
##D xobs<-188:197
##D y <- matrix(c(yobs,Ffd,Ftfd,Farma11,fEWMA), ncol=5)
##D colnames(y)<-c("obs", "FD", "TFD", "ARMA11","FEWMA")
##D x <- 197+1:ML
##D x <- matrix(c(xobs, rep(x, 4)), ncol=5)
##D plot(x, y, type="n", col=c("black", "red", "blue", "magenta"),
##D      xlab="t", ylab=expression(z[t]))
##D x <- 197+1:ML
##D points(xobs, yobs, type="o", col="black")
##D points(x, Ffd, type="o", col="red")
##D points(x, Ftfd, type="o", col="blue")
##D points(x, Farma11, type="o", col="brown")
##D points(x, fEWMA, type="o", col="magenta")
##D legend(200, 18.1, legend=c("observed", "EWMA", "FD", "TFD", "ARMA"),
##D        col=c("black", "magenta", "red", "blue", "brown"),
##D        lty=c(rep(1,5)))
##D   
## End(Not run)



