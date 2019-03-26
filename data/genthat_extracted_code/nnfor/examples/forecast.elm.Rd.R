library(nnfor)


### Name: forecast.elm
### Title: Forecast using ELM neural network.
### Aliases: forecast.elm
### Keywords: elm thief ts

### ** Examples

## Don't show: 
 fit <- elm(AirPassengers,reps=1)
 frc <- forecast(fit,h=36)
 print(frc)
 plot(frc)
## End(Don't show)
## Not run: 
##D  fit <- elm(AirPassengers)
##D  plot(fit)
##D  frc <- forecast(fit,h=36)
##D  plot(frc)
## End(Not run)




