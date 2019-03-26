library(frair)


### Name: fr_flexpnr
### Title: Scaling Exponent Response, not assuming replacement
### Aliases: fr_flexpnr flexpnr flexpnr_fit flexpnr_nll

### ** Examples

# A 'type-II' example
data(gammarus)

rogfit <- frair_fit(eaten~density, data=gammarus, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))
expofit <- frair_fit(eaten~density, data=gammarus, 
                response='flexpnr', start=list(b = 1.2, q = 0, h = 0.015), 
                fixed=list(T=40/24))
## Plot
plot(rogfit)
lines(rogfit)
lines(expofit, col=2)

## Inspect
summary(rogfit$fit)
summary(expofit$fit) # No evidence that q is different from zero...
AIC(rogfit$fit)
AIC(expofit$fit) # The exponent model is *not* preferred

# A 'type-III' example
data(bythotrephes)

rogfit <- frair_fit(eaten~density, data=bythotrephes, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=12/24))
expofit <- frair_fit(eaten~density, data=bythotrephes, 
                response='flexpnr', start=list(b = 1.2, q = 0, h = 0.015), 
                fixed=list(T=12/24))
## Plot
plot(rogfit)
lines(rogfit)
lines(expofit, col=2)

## Inspect
summary(rogfit$fit)
summary(expofit$fit) # Some evidence that q is different from zero...
AIC(rogfit$fit)
AIC(expofit$fit) # The exponent model is preferred



