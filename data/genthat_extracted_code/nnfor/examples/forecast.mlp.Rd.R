library(nnfor)


### Name: forecast.mlp
### Title: Forecast using MLP neural network.
### Aliases: forecast.mlp
### Keywords: mlp thief ts

### ** Examples

## Don't show: 
 fit <- mlp(AirPassengers,reps=1)
 frc <- forecast(fit,h=36)
 print(frc)
 plot(frc)
## End(Don't show)
## Not run: 
##D  fit <- mlp(AirPassengers)
##D  plot(fit)
##D  frc <- forecast(fit,h=36)
##D  plot(frc)
## End(Not run)




