library(nnfor)


### Name: elm
### Title: Extreme learning machines for time series forecasting
### Aliases: elm
### Keywords: mlp thief ts

### ** Examples

## Don't show: 
 fit <- elm(AirPassengers,reps=1)
 print(fit)
 plot(fit)
## End(Don't show)
## Not run: 
##D  fit <- elm(AirPassengers)
##D  print(fit)
##D  plot(fit)
##D  frc <- forecast(fit,h=36)
##D  plot(frc)
## End(Not run)




