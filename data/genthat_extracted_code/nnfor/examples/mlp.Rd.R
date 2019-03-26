library(nnfor)


### Name: mlp
### Title: Multilayer Perceptron for time series forecasting
### Aliases: mlp
### Keywords: mlp thief ts

### ** Examples

## Don't show: 
 fit <- mlp(AirPassengers,reps=1)
 print(fit)
 plot(fit)
## End(Don't show)
## Not run: 
##D  fit <- mlp(AirPassengers)
##D  print(fit)
##D  plot(fit)
##D  frc <- forecast(fit,h=36)
##D  plot(frc)
## End(Not run)




