library(tsutils)


### Name: theta
### Title: Theta method
### Aliases: theta forecast.theta plot.theta theta.thief
### Keywords: ts

### ** Examples

fit <- theta(referrals)
plot(fit)

forecast.theta(fit,h=12) # Or simply use forecast(fit)

## Not run: 
##D library(thief)
##D thief(referrals,forecastfunction=theta.thief)
## End(Not run)




