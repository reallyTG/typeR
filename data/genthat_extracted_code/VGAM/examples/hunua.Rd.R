library(VGAM)


### Name: hunua
### Title: Hunua Ranges Data
### Aliases: hunua
### Keywords: datasets

### ** Examples

# Fit a GAM using vgam() and compare it with the Waitakere Ranges one
fit.h <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = hunua)
## Not run: 
##D plot(fit.h, se = TRUE, lcol = "orange", scol = "orange",
##D      llwd = 2, slwd = 2, main = "Orange is Hunua, Blue is Waitakere") 
## End(Not run)
head(predict(fit.h, hunua, type = "response"))

fit.w <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = waitakere)
## Not run: 
##D plot(fit.w, se = TRUE, lcol = "blue", scol = "blue", add = TRUE) 
## End(Not run)
head(predict(fit.w, hunua, type = "response"))   # Same as above?



